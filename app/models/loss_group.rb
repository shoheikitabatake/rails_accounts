class LossGroup < ActiveRecord::Base
  has_many :losses, dependent: :destroy, foreign_key: :group_id
end
