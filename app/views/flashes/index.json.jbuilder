json.array!(@flashes) do |flash|
  json.extract! flash, :id, :game
  json.url flash_url(flash, format: :json)
end
