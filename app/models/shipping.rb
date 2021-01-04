class Shipping < ApplicationRecord
  belongs_to :buy

  with_options presence: true do
    validates :postal_code
    validates :shipment_source_address_id
    validates :municipality
    validates :address
    validates :phone
  end
end
