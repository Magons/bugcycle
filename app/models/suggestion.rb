class Suggestion < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
  belongs_to :category
end
