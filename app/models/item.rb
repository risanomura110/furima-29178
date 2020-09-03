class Item < ApplicationRecord
  has_many :comments
  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :schedule
  validates :image, :item_name, :info, :category, :status, :shipping, :area, :schedule, :price, :user, presence: true
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :schedule_id
  end
  validates :price,
            numericality: { only_integer: true,
                            greater_than: 300, less_than: 9_999_999 }
end
