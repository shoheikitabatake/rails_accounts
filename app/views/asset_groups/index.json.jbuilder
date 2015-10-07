json.array!(@asset_groups) do |asset_group|
  json.extract! asset_group, :id, :user_id, :name
  json.url asset_group_url(asset_group, format: :json)
end
