class BuyShipping

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_source_address_id,
  :municipality, :address,
  :building, :phone, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipment_source_address_id, numericality: { other_than: 1, message: "Shipment source address is not a number" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :token
  end
  

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code,shipment_source_address_id: shipment_source_address_id, municipality: municipality, address: address, building: building, phone: phone, buy_id: buy.id)
  end
end