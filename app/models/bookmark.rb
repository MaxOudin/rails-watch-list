class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # Validations
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
end
