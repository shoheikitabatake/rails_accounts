json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :grade
  json.url user_url(user, format: :json)
end
