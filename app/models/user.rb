class User < ApplicationRecord
    validates :name, presence: true 
    has_many :categories
    has_many :payments
end
