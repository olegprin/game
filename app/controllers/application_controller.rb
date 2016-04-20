class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
   
  before_action :set_tags
    include ApplicationHelper
  
  def set_tags
    @categories_tags=Category.all.sample(13)
  end
  





 

  rescue_from Cinema::NotFound do
    render_404
  end

  rescue_from Cinema::InvalidAccess do
    render_404
  end

  rescue_from Cinema::ReadOnly do
    render_404
  end

  def user_present?
    current_user.present?
  end
  
  def role?(role)
    if current_user.role==role.to_s
      return true
    else
      return false
    end  
  end

  def render_404  
    respond_to do |format|  
      format.html { render :file => "#{Rails.root}/public/404.html", :status => '404 Not Found' }  
      format.xml  { render :nothing => true, :status => '404 Not Found' }  
    end  
    true  
  end
  
  def only_admin_or_moderator
    if current_user.present?
      current_user.role=="moderator" ? true : (redirect_to root_path)  
    else
      redirect_to root_path  
    end 
  end 

  def only_admin
    if current_user.present?
      current_user.admin==true ? true : (redirect_to root_path)  
    else
      redirect_to root_path  
    end 
  end 

  def guardian
    @guardian ||= Guardian.new(current_user)
  end

  private

    def current_author_for_object(method, object)  
      if current_user.present?  
        if method==object.id
          return true 
        else
          false        
        end
      else
        false 
      end 
    end



 
end
