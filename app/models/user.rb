class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/
  validates :password, format:{ with: VALID_PASSWORD_REGEX }

  validates :name, presence: true
  validates :last_name_chinese_character, presence: true, format: {with: /\A[一-龥ぁ-ん]/ }
  validates :first_name_chinese_character, presence: true, format: {with: /\A[一-龥ぁ-ん]/ }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth, presence: true

end
