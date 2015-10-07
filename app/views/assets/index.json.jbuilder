json.array!(@assets) do |asset|
  json.extract! asset, :id, :user_id, :group_id, :name, :stock
  json.url asset_url(asset, format: :json)
end
