json.array!(@debts) do |debt|
  json.extract! debt, :id, :user_id, :group_id, :name, :stock
  json.url debt_url(debt, format: :json)
end
