json.array!(@users) do |user|
  json.extract! user, :name ,:id, :image
  json.url user_url(user, format: :json)
end