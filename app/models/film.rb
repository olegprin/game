class Film < ActiveRecord::Base
  
  include ObjectModel::Model
  
  has_many :comments, as: :commentable
  has_one :user
  has_many :voices
  has_one :flash
 
  if I18n.locale == :en 
    CATEGORY = %w[Action Comedy History Other] 
  else I18n.locale == :ru 
    CATEGORY=%w[Экшин Комедия Историческое Другое]
  end    
  
  @model_of_attachment='uploaded_file'.parameterize.underscore.to_sym


  include ValidationsForPicture
  include ValidationsForTorent 
  
  def self.search_product(params_search, params_page)
    self.search(params_search).paginate(:page => params_page, :per_page => Configurable['films_per_page'])
  end  

  def send_film_to_user
    FilmMailer.new_film(self).deliver_now
  end

end


  