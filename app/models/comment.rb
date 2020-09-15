class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user 
  validates :text, presence: true
 #コメント空で保存できなくなる

end
