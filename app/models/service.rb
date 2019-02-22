class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :picture, PhotoUploader
  validates :picture, presence: { message: "Merci de mettre une photo" }
  validates :menu, presence: { message: "Merci d'indiquer un menu" }
  validates :menu_name, presence: { message: "Merci d'indiquer le nom de votre menu" }
  validates :price, presence: { message: "Merci d'indiquer le tarif par personne" }
  validates :max_quantity, presence: { message: "Merci d'indiquer le nombre de couverts" }
  validates :category, presence: { message: "Merci d'indiquer ***" }
  validates :date, presence: { message: "Merci d'indiquer vos disponibilités" }
  validates :shift, presence: { message: "Merci de selectionner un champs" }


  include PgSearch
  pg_search_scope :search_by_menu_name_and_category,
    against: [:menu_name, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
