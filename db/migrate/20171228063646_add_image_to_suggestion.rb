class AddImageToSuggestion < ActiveRecord::Migration[5.1]
  def change
    add_column :suggestions, :image, :string
  end
end
