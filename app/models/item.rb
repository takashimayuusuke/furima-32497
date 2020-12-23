class Item < ApplicationRecord
  has_many :items


  extend ActiveHash::Associations::ApplicationRecordExtensions
  belongs_to :explanation_category

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  validates :explanation_category_id, numericality: { other_than: 1 }
  validates :explanation_condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipment_source_address_id, numericality: { other_than: 1 }

end
