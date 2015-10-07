json.array!(@debt_groups) do |debt_group|
  json.extract! debt_group, :id, :user_id, :name
  json.url debt_group_url(debt_group, format: :json)
end
