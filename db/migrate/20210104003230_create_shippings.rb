class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code,                  null: false
      t.integer :shipment_source_address_id,  null: false
      t.string :municipality,                 null: false
      t.string :address,                      null: false
      t.string :building
      t.string :phone,                        null: false
      t.references :buy,                      foreign_key: true

      t.timestamps
    end
  end
end
