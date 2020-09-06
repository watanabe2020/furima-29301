class CreateLivingPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :living_places do |t|
      t.references :buyer, foreign_key: true
      t.string  :postcode, null: false
      t.integer :prefecture_id, null: false
      t.string  :city, null: false
      t.string  :block, null: false
      t.string  :building
      t.string  :phone_number, null: false
      t.timestamps
    end
  end
end