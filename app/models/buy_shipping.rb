class BuyShipping

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :shipment_source_address_id,
  :municipality, :address,
  :building, :phone, :buy

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipment_source_address_id, numericality: { other_than: 1, message: "Shipment source address is not a number" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/ }
  end
  

  def save
    user = User.create(name: name )
    item = Item.create(item: item )
    Buy.create(user_id: user.id, item: item.id)
    Shipping.create(postal_code: postal_code,shipment_source_address_id: shipment_source_address_id, municipality: municipality, address: address, building: building, phone: phone, buy: buy)
  end
end