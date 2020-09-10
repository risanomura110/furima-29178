class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :postal,
            :prefecture,
            :city,
            :add,
            :phone,
            :order,
            presence: true
  # with_options numericality: { other_than: 1, message: 'Select' } do
  #   validates :prefecture_id
  # end
end
