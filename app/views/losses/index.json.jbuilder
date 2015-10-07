json.array!(@losses) do |loss|
  json.extract! loss, :id, :user_id, :group_id, :name, :budget
  json.url loss_url(loss, format: :json)
end
