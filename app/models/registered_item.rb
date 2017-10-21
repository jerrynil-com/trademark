class RegisteredItem < ApplicationRecord
  belongs_to :register
  belongs_to :item
end
