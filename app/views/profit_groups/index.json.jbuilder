json.array!(@profit_groups) do |profit_group|
  json.extract! profit_group, :id, :user_id, :name
  json.url profit_group_url(profit_group, format: :json)
end
