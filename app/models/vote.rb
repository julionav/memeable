# votes_count
class Vote < ApplicationRecord
  # Associations
  belongs_to :meme, counter_cache: true
  belongs_to :user

  # Validations
  # meme, usuario
  validates_uniqueness_of :user_id, scope: :meme_id, message: "Can't vote a meme more than once"
end