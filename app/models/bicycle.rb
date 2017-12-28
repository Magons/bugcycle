class Bicycle < ApplicationRecord
  has_many :suggestions
  has_many :marks
  belongs_to :user
  belongs_to :category

  validates :name, uniqueness: { case_sensitive: true }

  scope :filter_by_category, -> (category_id) {
    category_id.present? ? where(category_id: category_id) : nil
  }
  scope :search, -> (pattern, user) {
    if pattern.blank?
      all
    else
      includes(:marks)
        .where.not(id: marked_ids(user.id))
        .where('name LIKE ? OR description LIKE ?', "%#{pattern}%", "%#{pattern}%")
    end
  }

  def favorites?(user)
    marks.any? { |m| m.user_id == user.id }
  end

  def has_suggestion?(user)
    suggestions.any? { |s| s.user_id == user.id }
  end

  def self.marked_ids(user_id)
    joins(:marks).where(marks: { user_id: user_id }).ids
  end
end
