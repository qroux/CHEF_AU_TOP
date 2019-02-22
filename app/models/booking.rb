class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :place, presence: true
  validates :quantity, presence: true
end
