class Film < ActiveRecord::Base
  
  has_one :user
  has_many :category_films 
  CATEGORY = [ "Mario", "Action", "Purchase order" ]   
  
  @model_of_attachment='uploaded_file'.parameterize.underscore.to_sym
  include ValidationsForPicture
  include ValidationsForTorent 
  
  def self.search_product(params_search, params_page)
    self.search(params_search).paginate(:page => params_page, :per_page => Configurable['films_per_page'])
  end  


end


  