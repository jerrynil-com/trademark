class Item < ApplicationRecord
  belongs_to :category
  has_many :registered_items
end
