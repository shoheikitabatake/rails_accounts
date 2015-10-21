json.array!(@journals) do |journal|
  json.extract! journal, :id, :user_id, :debit_type, :debit_id, :credit_type, :credit_id, :amount, :trade_date, :memo
  json.url journal_url(journal, format: :json)
end
