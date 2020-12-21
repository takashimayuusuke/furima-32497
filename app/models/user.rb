class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items


  validates :name, presence: true
  validates :last_name_chinese_character, presence: true
  validates :first_name_chinese_character, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth, presence: true

end
