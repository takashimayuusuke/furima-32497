class Item < ApplicationRecord
  has_many :items
  extend ActiveHash::Associations::ApplicationRecordExtensions
  berongs_to :explanation_category


end
