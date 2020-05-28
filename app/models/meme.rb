# frozen_string_literal: true

class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  # Associations
  belongs_to :category
  belongs_to :owner, class_name: "User", counter_cache: true
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :commentators, through: :comments, source: :user
  has_many :votes
  has_many :voters, through: :votes, source: :user

  # Enums
  enum type: { image: "image", gif: "gif" }

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true
  validates :url_source, presence: true,
            format: {
              with: %r{\Ahttps?://.+(png|gif|jpg)\z},
              message: "Add a valid meme URL"
            }
end
