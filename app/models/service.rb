class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :picture, PhotoUploader
  validates :picture, presence: true
  include PgSearch
    pg_search_scope :search_by_menu_name_and_category,
    against: [:menu_name, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
