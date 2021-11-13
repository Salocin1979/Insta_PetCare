class Prescription < ApplicationRecord
  belongs_to :consultation
  validates :date, :content, presence: true
end
