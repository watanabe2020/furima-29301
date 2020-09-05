class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references    :user, foreign_key: true
      t.string       :name,                   null: false
      t.integer      :price,                  null: false
      t.text         :product_description,    null: false
      t.integer      :category_id,            null: false
      t.integer      :product_status_id,      null: false
      t.integer      :postage_id,             null: false
      t.integer      :ship_from_id,           null: false
      t.integer      :date_of_shipment_id,    null: false
      t.timestamps
    end
  end
end
