class Specie < ApplicationRecord
    has_many :animals, dependent: :destroy
    has_many :symptoms, dependent: :destroy
end
