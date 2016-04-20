json.array!(@category_films) do |category_film|
  json.extract! category_film, :id, :category, :film_id, :integer
  json.url category_film_url(category_film, format: :json)
end
