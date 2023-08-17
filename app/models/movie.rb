class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  before_destroy :check_for_bookmarks
end
