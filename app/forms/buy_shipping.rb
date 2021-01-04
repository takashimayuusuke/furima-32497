class Buy_Shipping

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :shipment_source_address_id,
  :municipality, :address,
  :building, :phone, :buy,

  with_options presence: true do
    validates :postal_code
    validates :shipment_source_address_id
    validates :municipality
    validates :address
    validates :phone
  end
