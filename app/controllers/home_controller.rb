class HomeController < ApplicationController

respond_to :html, :js, :json

 def index
    
 end 

 def all_film
   
    @film_s=Film.all
    count=@film_s.count
        @films=@film_s[count-12..-1]
        @films_else=@film_s[0..count-11].paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
    @film_pag=Film.all.paginate(:page => params[:page], :per_page => Configurable['films_per_page'])
   respond_to do |format|
        format.html { }
        format.json {  }
        format.js { }
    end   
  end 

end  
	

