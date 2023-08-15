class Detail < ApplicationRecord
  belongs_to :user
  has_many :category_details, dependent: :destroy
  has_many :categories, through: :category_details

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
