class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.string :description
      t.references :bicycle, foreign_key: true

      t.timestamps
    end
  end
end
