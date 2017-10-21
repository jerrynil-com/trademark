class CreateRegisteredItems < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_items do |t|
      t.belongs_to :register, index: true
      t.belongs_to :item, index: true

    end
  end
end
