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
end
