module CategoriesHelper

  def count_of_film(category)
    Category_films.where(category).film_id
    #Film.where(id: )
  end
    
end
