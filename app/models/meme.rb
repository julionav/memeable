# frozen_string_literal: true

class Meme < ApplicationRecord
  self.inheritance_column = :_ # Disable STI
  # Associations
  belongs_to :category
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :voters, join_table: "memes_users", class_name: "User"
  has_many :comments
  has_many :commentators, through: :comments, source: :user

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
