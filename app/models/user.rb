class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :details, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end
end
