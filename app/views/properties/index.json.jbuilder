json.array!(@properties) do |property|
  json.extract! property, :id, :user_id, :group_id, :name, :stock
  json.url property_url(property, format: :json)
end
