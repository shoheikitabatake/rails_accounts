json.array!(@profits) do |profit|
  json.extract! profit, :id, :user_id, :group_id, :name, :budget
  json.url profit_url(profit, format: :json)
end
