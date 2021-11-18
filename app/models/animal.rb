class Animal < ApplicationRecord
    belongs_to :user
    belongs_to :specie
    has_one_attached :photo
    has_many :consultations, dependent: :destroy
    has_many :prescriptions, through: :consultations
end
