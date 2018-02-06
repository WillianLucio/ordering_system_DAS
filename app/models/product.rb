class Product < ApplicationRecord
  validates :description, :value, presence: true
  validates :value, numericality: { greater_than: 0 }
end
  
