json.array!(@pictures) do |picture|
  json.extract! picture, :id, :picture, :flash
  json.url picture_url(picture, format: :json)
end
