json.array!(@loss_groups) do |loss_group|
  json.extract! loss_group, :id, :user_id, :name
  json.url loss_group_url(loss_group, format: :json)
end
