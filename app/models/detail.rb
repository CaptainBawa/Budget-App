class Detail < ApplicationRecord
  belongs_to :user
  has_many :category_details
  has_many :categories, through: :category_detail
end
