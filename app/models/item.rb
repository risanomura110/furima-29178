class Item < ApplicationRecord
  has_many :comments
  has_one :order
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :schedule
  #空の投稿を保存できないようにする
  validates :image, :item_name, :info, :category, :status, :shipping, :area, :schedule, :price, :user, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:status_id, :shipping_id, :area_id, :schedule_id, numericality_id: { other_than: 1 } 
end
