class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :memes
  has_many :votes
  has_many :voted_memes, through: :votes, source: :meme
  has_many :comments
  has_many :commented_memes, through: :comments, source: :meme

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
