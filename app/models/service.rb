class Service < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PhotoUploader
end
