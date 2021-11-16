class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_many :prescriptions, dependent: :destroy
end
