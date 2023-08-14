class Category < ApplicationRecord
  belongs_to :user
  has_many :category_details, dependent: :destroy
  has_many :details, through: :category_detail

  validates :name, presence: true
  validates :icon, presence: true
end
