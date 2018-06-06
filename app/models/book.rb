class Book < ApplicationRecord
  has_many :questions, dependent: :destroy
end
