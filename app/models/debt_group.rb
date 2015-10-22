class DebtGroup < ActiveRecord::Base
  has_many :debts, dependent: :destroy, foreign_key: :group_id
end
