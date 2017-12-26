class Bicycle < ApplicationRecord
  has_many :suggestions
  has_many :marks
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: true }

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name LIKE ? OR description LIKE ?', "%#{pattern}%", "%#{pattern}%")
    end
  end

  def favorites?(user)
    marks.any? { |m| m.user_id == user.id }
  end
end
