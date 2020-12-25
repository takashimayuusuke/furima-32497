class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :explanation_category
  belongs_to :explanation_condition
  belongs_to :delivery_fee
  belongs_to :shipment_source_address
  belongs_to :shipment_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates_inclusion_of :price, in: 300..9_999_999
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :explanation_category_id
    validates :explanation_condition_id
    validates :delivery_fee_id
    validates :shipment_source_address_id
    validates :shipment_day_id
  end
end
