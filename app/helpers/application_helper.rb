require 'devise'
require 'will_paginate/array' 
module ApplicationHelper
  
  #before_action user_signed_in?, only: :can_manage
  #<%#= ui_button 'read', t(:show),show_posting_posting_path(posting), data: { modal: true } %>
  def insert_twitter_box
    if File::exist?(
         filename=File::join(Rails.root,"config/twitter.html")
       )
       File.new(filename).read.html_safe
    end
  end
  
   def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
  
  def custom_assets(source, ext)
    path = File.join(Rails.root, 'assets', source) + ext
    asset_id = File.exist?(path) ? File.mtime(path).to_i.to_s : ''
    "#{source}?#{asset_id}"
  end

  
  def insert_category(film)
    all_category=[]
    film.category_films.map {|category| all_category<<category.category_of_game}
    @all_category=all_category
  end
  
  def all_link(film)
    insert_category(film)
    @current_category=[] 
    @all_category.each do |category|
      @current_category<<Category.where(category: category)
    end
  end

  def full_title(page_title = "Database of films")
    title("#{page_title}")
  end
  
  def sum_voice(vote_flag, resourse, id)
    if Voice.where(vote_flag: vote_flag).where(votable_type: resourse.to_s).where(votable_id: id).present? 
   @voice=Voice.where(vote_flag: vote_flag).where(votable_type: resourse.to_s).where(votable_id: id) 
     a=@voice.map { |m| m.sum_voices}
     b=a.inject{|sum,x| sum+x}
     return b
    else
      "0"
    end
  end   
    
  def button_help(text)
    raw("<button type='button', class='btn btn-info'>"+text+"</button>")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def last_film
    @last_film=Film.order('created_at DESC').limit(5)
  end  


  def insert_extra_headers
    "#{Configurable['copyright']}
     #{strip_tags(Configurable['name'])} | #{strip_tags(Configurable['slogan'])}
     content='RAILS, Magazine, Application Template, devise, cancan, omniAuth, Programming, Mac OS X, iOS, Web-Development' 
     #{Configurable['admin_notification_address']}"
  end

  def insert_google_analytics_script
    if File::exist?(
         filename=File::join(Rails.root,"config/google_analytics.head")
       )
       File.new(filename).read.html_safe
    end
  end

  # insert google site search if file exists
  def insert_google_site_search
    if File::exist?(
         filename=File::join(Rails.root,"config/google_site_search.html")
       )
       File.new(filename).read.html_safe
    end
  end
  
  #Film,film
  def user_created_object(resourse, resourse_id)
    current_film=resourse.find(resourse_id.id)
    User.find(current_film.user_id)
  end  
  
    
  def markdown(text)
    options = {
      autolink: true,
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }
    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
  

  
  def insert_text(text,size=10000)
    
      markdown(truncate(text.gsub(/(<[^>]+>)/, ''),length:size, omission: '... (continued)'))
   
  end 

  def errors_for(resource)
    rc = ""
    if resource.errors.any?
      
      rc += "<div id='error_explanation'>"+
           
              "<ul>" +
                 resource.errors.full_messages.map { |msg|
                   "<li><b>"+ msg.split(" ",2)[0] + "</b>: " + msg.split(" ",2)[1] +"</li>"
                 }.join
            if defined? resource.attachments
               rc.each do |attr|
                  unless attrs_to_retain.include?(attr)
                   errors.delete(attr)
                 end
               end
              rc += "<ul>" +
                    resource.attachments.map { |p|
                       p.errors.map { |error|
                         "<li>" + p.errors[error].join(", ".html_safe) + "</li>"
                       }.join
                    }.join +
                    "</ul>"
            end
      rc += "</ul></div>"
     
      rc.html_safe
    end
  end

  def current_author_for_object(resourse, object)  

      if resourse.where(id: object.id).present?
        true
      else
        false
      end     
      
  end

  #-if can_manage(current_user.films,film, Film)
  def can_manage(resourse, object,name_resourse) 
      if (can?(:edit, name_resourse)) || current_author_for_object(resourse, object)  
        true
      else 
        false 
      end 
  end
     
   def current_author_for_object_has_one(resourse, object)  
      if resourse.id==object.id
        true
      else
        false
      end  
   end
    
   def can_manage_has_one(resourse, object,name_resourse)
    if user_signed_in?  
      if (can?(:edit, name_resourse)) || current_author_for_object_has_one(resourse, object)  
        true
      else 
        false 
      end 
    end 
  end

  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
    presenter
  end

  def interpret(object,interpreter=nil,klass=nil)
    presenter = present(object,klass)
    interpreter ||= Interpreter.new(object,presenter,self)
    presenter.interpreter = interpreter
    yield presenter if block_given?
    presenter
  end
  


  def publication_status(post)
    if post.created_at
      time_ago_in_words(post.created_at)
    else
      'Draft'
    end
  end

















def title(page_title, show_title = true)
    #content_for(:title) { h(page_title.html_safe) }
    @show_title = show_title
  end

  # Let's see if there is a title for the h1-title
  def show_title?
    @show_title
  end

  # Put stylesheets in the yield used in application.html.erb
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  # Put javascripts to the html-head
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  # Outputs a Javascript to place the title of a page at the URL in cases
  # where the page was addressed by it's ID
  # ==parameters:
  #   page:
  #     The `Page` to set address for
  #   title:
  #     HTML-Title to use
  def set_browser_address(page,title)
    unless title.length > CONSTANTS['title_max_length'].to_i
      address = "/p/"+title.txt_to_url
      "<script>
         history.replaceState( {page: '#{page}'},'#{title}', '#{address}');
       </script>".html_safe
     end
  end

  # Replace blanks by %20 to satisfy w3c-validators
  # Attantion: This is implemented in BasePresenter too!
  def w3c_url(url)
    url.gsub(' ', '%20')
  end
  
  # Links as buttons
  def link_button( label_txt, button_options, *args )
    link_to label_txt, *args, :class => button_options
  end
  
  # render a pagination box if resource has items
  # @param [Array] paginations the slected Items to display
  def render_pagination_box paginations
    unless paginations.nil?
      if paginations.total_pages > 1
        will_paginate(paginations)
      end
    end
  end

  def current_tag_cache_key
    key = "tag_cloud_" + (current_user ? current_user.id.to_s : 'public')
  end
  
  # render a tag-cloud
  def tag_cloud
    ContentItem::normalized_tags_with_weight(Posting).map { |tag,weight|
      unless tag.blank?
        if accessible_postings(tag,current_role).any?
          content_tag :span, :class => "tag-weight-#{weight.to_s.gsub('.','-')}" do
            link_to( "#{tag}", tags_path(tag))
          end
        end
      end
    }.compact.join(" ").html_safe
  end
  
  #ui_button 'edit',  t(:edit), edit_blog_path(blog)
  # render jquery-ui-buttons
  def ui_button(icon,label_text,url,options={})
    setup_button(icon,label_text,options)
    link_to( icon_and_text(label_text,icon), url, options ).html_safe
  end

  # render button for link_to_function
  def ui_link_to_function(icon,label_text,function_call,options={})
    setup_button(icon,label_text,options)
    link_to_function(icon_and_text(label_text,icon),function_call,options).html_safe
  end
  

  def can_edit(resourse_action, action)
    
  end  
  
  def accessible_postings(tag,role)
    _ids = Blog.for_role(role).only(:id).map{ |blog|
      blog.postings_for_user_and_mode(current_user,draft_mode).only(:id).map(&:_id)
    }.flatten
    Posting.any_in(_id: _ids).tagged_with(tag)
  end

   def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end
  
private

  def setup_button(icon,label_text,options)
    class_names = 'ui-button ui-widget ui-state-default ui-corner-all'
    if options[:add_class]
      class_names += " " + options[:add_class]
      options.delete(:add_class)
    end
    style = 'padding: 5px; padding-top: 2px; padding-bottom: 3px; text-align: left;'           
    if options[:add_style]
      style += " " + options[:add_style]
      options.delete(:add_style)
    end     
    options.merge!( class:  class_names, style:  style)
    options.merge!( title: I18n.translate(icon.to_sym)) if label_text.blank?
  end

  def icon_and_text(text, icon)
    rc = ""
    rc = icon ? content_tag( :span, 
                 :style => 'display: inline-block; width: 16px; height: 16px;', 
                 :class => "ui-icon ui-icon-#{map_icon(icon)}") {} : ''
    rc +=  content_tag(:span, :class => 'button-label') { text }
    rc.html_safe
  end

  def map_icon(shortcut)
    case shortcut
    when 'download'
      'arrowthickstop-1-s'  
    when 'back'
      'arrowreturnthick-1-n'  
    when 'read', 'read-link', 'show'
      'newwin'
    when 'edit'
      'pencil'
    when 'destroy', 'delete'
      'trash'
    when 'add', 'plus'
      'plusthick'
    when 'exit'
      'transferthick-e-w'
    when 'back'
      'circle-arrow-w'
    when 'mark-read'
      'mail-open'
    when 'mark-unread', 'mail', 'email'
      'mail-closed'
    when 'details', 'zoom'
      'zoomin'
    when 'sort'
      'arrowthick-2-n-s'
    when 'table'
      'calculator'
    when 'search'
      'search'
    when 'pdf'
      'document'
    when 'video'
      'video'
    when 'expand'
      'folder-open'
    when 'collapse'
      'folder-collapsed'
    when 'attachment'
      'bookmark'
    when 'todo'
      'signal-diag'
    when 'question'
      'help'
    when 'assets'
      'suitcase'
    when 'contact', 'people', 'vcard', 'groups'
      'contact'
    when 'print'
      'print'
    else
      shortcut
    end
  end

end
