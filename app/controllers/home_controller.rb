class HomeController < ApplicationController

 def index
    
 end 

 def all_film
    @films=Film.all
 end 

end  