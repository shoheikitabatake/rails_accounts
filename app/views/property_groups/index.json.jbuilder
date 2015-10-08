json.array!(@property_groups) do |property_group|
  json.extract! property_group, :id, :user_id, :name
  json.url property_group_url(property_group, format: :json)
end
