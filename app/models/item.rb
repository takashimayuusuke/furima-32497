class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :explanation_category
  belongs_to :explanation_condition
  belongs_to :delivery_fee
  belongs_to :shipment_source_address
  belongs_to :shipment_day

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  validates :explanation_category_id, numericality: { other_than: 1 }
  validates :explanation_condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :shipment_source_address_id, numericality: { other_than: 1 }
  validates :shipment_day_id, numericality: { other_than: 1 }

end
