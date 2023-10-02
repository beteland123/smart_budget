class Category < ApplicationRecord
    belongs_to :user
    has_many :payments
    
    validates :icon, presence: true
    validates :name, presence: true
    
    
end
