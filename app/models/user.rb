class User < ApplicationRecord
    has_many :details
    has_many :categories
end
