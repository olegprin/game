json.array!(@categories) do |category|
  json.extract! category, :id, :upload_picture, :category
  json.url category_url(category, format: :json)
end
