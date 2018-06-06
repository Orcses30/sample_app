class Question < ApplicationRecord
  belongs_to :book
  #validates :user_id, presence: true
  #validates :content, presence: true, length: { maximum: 140 }
end
