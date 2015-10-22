class ProfitGroup < ActiveRecord::Base
  has_many :profits, dependent: :destroy, foreign_key: :group_id
end
