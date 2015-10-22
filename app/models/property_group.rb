class PropertyGroup < ActiveRecord::Base
  has_many :properties, dependent: :destroy, foreign_key: :group_id
end
