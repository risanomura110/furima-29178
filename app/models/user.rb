class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,
            format: { with: PASSWORD_REGEX }
  validates :family_kanji, :first_kanji, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :family_kanji, :first_kanji,
            format: { with: NAME_REGEX }
  validates :family_kana, :first_kana, presence: true
  NAMEKANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :family_kana, :first_kana,
            format: { with: NAMEKANA_REGEX }
end
