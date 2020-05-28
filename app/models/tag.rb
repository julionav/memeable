class Tag < ApplicationRecord
  # Associations
  has_and_belongs_to_many :memes

  # Validations
  validates :name, uniqueness: true, presence: true
end
