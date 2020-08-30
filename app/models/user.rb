class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday, presence: true 
  # validates :email,  inclusion: { in: ["@"] }←デフォルトで"@"が含まれないと保存できない
  validates :password,
  format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_kanji, :first_kanji, presence: true 
  validates :family_kanji, :first_kanji,
  format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_kana, :first_kana, presence: true 
  validates :family_kana, :first_kana,
  format: { with: /\A[ァ-ン]+\z/ }
end