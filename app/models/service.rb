class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :picture, PhotoUploader
end
