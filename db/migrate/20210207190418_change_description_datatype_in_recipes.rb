class ChangeDescriptionDatatypeInRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :description, :string
    add_column :recipes, :description, :text
  end
end
