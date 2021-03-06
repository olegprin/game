class FilmsController < ApplicationController


  #before_action :authenticate_user!, :only => [:edit, :new, :create, :update,:destroy]  
  #load_and_authorize_resource
  
  before_action :set_film, only: [:show_modal,:get, :upload, :show, :edit, :update, :destroy, :upvote, :downvote ]
  before_action :define_eccept, only: [:edit, :update, :destroy]
 
  #before_action :cul_user, :except => [:show, :index]  
 
  respond_to :html, :js, :json
  # GET /films
  # GET /films.json
  def index
    @films = Film.all.paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end 
  # GET /films/1
  # GET /films/1.json
  def show

  end

  def search
    @search=params[:search].titleize
    @films = Film.where(["title LIKE ?", @search]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end  
  # GET /films/new
  def new
    @film = Film.new
  end
  
  def show_modal
    @user=User.find(@film.user_id)
    @info=@user.info
    respond_modal_with @film
  end  
  # GET /films/1/edit
  def edit
     
  end
  
  def create
    @film=Film.create(film_params)
    #a=Dir.entries("picture").select {|f| !File.directory? f}
 #  a.each do |a|
    #@film = Film.create(title: a)

  #end  
    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json {  }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        #@film.update_attributes(title: save_title(@film.title), language: save_title(@film.language), actor: save_title(@film.actor), subtitle: save_title(@film.subtitle))
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { redirect_to @film }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def play_game 
    @film = Film.find(params[:id])
    @film.update_attributes(played: (@film.played+1))
    if Film.where(category: @film.category).count < 15
      @films=Film.all.sample(16)
    else
      @films=Film.where(category: @film.category).sample(16)
    end 
      @films_left=@films[0..4]
      @films_right=@films[5..9]
      @films_down=@films[10..15]
  end 

  def other
    @films = Film.where(category: ["Other", "Другое"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film" 
  end 

  def documental
    @films = Film.where(["category LIKE ?", "Documental"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end 
  


 def save_title(title)
    title.chomp.titleize
  end

  def action
    @films = Film.where(category: ["Action", "Экшин"]).paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    render "all_film"
  end
  

  def upvote
    @film.upvote_from current_user
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def downvote
    @film.downvote_from current_user
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end 


  def download
    fileName=params[:download][:fileName]
    send_file(Rails.root.join('public','files', fileName))
  end
  
  private

  def define_eccept   
    if current_user.admin=="t"
      return true
    else
      redirect_to root_path 
    end
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_film
    begin
      @film=Film.find(params[:id])
    rescue
      raise Cinema::NotFound 
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def film_params
    params.require(:film).permit(:year,:title, :description, :category, :played, :subtitle, :rating, :year,:image, :uploaded_file, :remove_image, :user_id, :down_file)
  end

end
