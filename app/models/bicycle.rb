class Bicycle < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: true }

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name LIKE ? OR description LIKE ?', "%#{pattern}%", "%#{pattern}%")
    end
  end
end
