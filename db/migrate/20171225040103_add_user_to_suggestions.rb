class AddUserToSuggestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :suggestions, :user, foreign_key: true
    add_reference :suggestions, :category, foreign_key: true
  end
end
