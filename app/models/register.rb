class Register < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :registered_items
  has_many :items, through: :registered_items
end
