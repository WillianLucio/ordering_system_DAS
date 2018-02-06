class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, :phone, presence: true
  validates_length_of :phone, maximum: 20
end
