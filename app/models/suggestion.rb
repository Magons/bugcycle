class Suggestion < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
  belongs_to :category

  validates :user_id, uniqueness: { scope: :bicycle_id }
end
