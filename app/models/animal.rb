class Animal < ApplicationRecord
    belongs_to :user
    belongs_to :specie
    has_one_attached :photo
end
