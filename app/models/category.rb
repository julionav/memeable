class Category < ApplicationRecord
  # Associations
  has_many :memes

  # Validations
  validates :name, uniqueness: true, presence: true
end
