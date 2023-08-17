class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # Validations
  validates :name, presence: true, uniqueness: true
end
