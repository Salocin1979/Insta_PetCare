class Specie < ApplicationRecord
    has_many :animals, dependent: :destroy
end
