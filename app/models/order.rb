class Order < ApplicationRecord
  # include ActiveModel::Model
  # attr_accessor :price, :token, :item_id, :user_id

  belongs_to :user
  belongs_to :item
  has_one :provision 
  validates :price, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
end
