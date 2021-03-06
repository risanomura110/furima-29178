class Item < ApplicationRecord
  has_many :comments
  has_one :order
  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ''
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :schedule
  validates :image, :item_name, :info, :category, :status, :shipping, :area, :schedule, :price, :user, presence: true
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :schedule_id
  end
  validates :price,
            numericality: { only_integer: true,
                            greater_than: 299, less_than: 10_000_000 }
end
