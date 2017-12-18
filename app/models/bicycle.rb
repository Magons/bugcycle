class Bicycle < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: true }
end
