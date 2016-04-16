class HomeController < ApplicationController

respond_to :html, :js, :json

 def index
    
 end 

 def all_film
    @films=Film.all.paginate(:page => params[:page], :per_page => Configurable['films_per_page']).order('created_at DESC')
    respond_to do |format|
        format.html { }
        format.json {  }
        format.js { }
    end   
  end 

end  
	

