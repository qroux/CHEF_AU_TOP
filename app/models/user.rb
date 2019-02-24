class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
has_many :services
has_many :bookings

  validates :first_name, presence: { message: "Merci d'indiquer votre prénom" }
  validates :last_name, presence: { message: "Merci d'indiquer votre nom'" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

mount_uploader :avatar, PhotoUploader
end
