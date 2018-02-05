class Client < ApplicationRecord
  validates :name, :phone, presence: true
  validates_length_of :phone, maximum: 16
end
