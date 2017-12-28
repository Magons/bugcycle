class Bicycle < ApplicationRecord
  has_many :suggestions
  has_many :marks
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: true }

  scope :filter_by_category, -> (category_id) {
    category_id.present? ? where(category_id: category_id) : nil
  }
  scope :search, -> (pattern) {
    pattern.blank? ? all : where('name LIKE ? OR description LIKE ?', "%#{pattern}%", "%#{pattern}%")
  }

  def favorites?(user)
    marks.any? { |m| m.user_id == user.id }
  end
end
