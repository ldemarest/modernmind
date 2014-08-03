json.array!(@minds) do |mind|
  json.extract! mind, :id, :name
  json.url mind_url(mind, format: :json)
end
