class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                          null: false
      t.integer :explanation_category_id,      null: false
      t.integer :explanation_condition_id,     null: false
      t.integer :delivery_fee_id,              null: false
      t.integer :shipment_source_address_id,   null: false
      t.integer :shipment_day_id,              null: false
      t.references :user,                      foreign_key: true
      t.text :explanation,                     null: false
      t.integer :price,                        null: false
      t.timestamps
    end
  end
end
