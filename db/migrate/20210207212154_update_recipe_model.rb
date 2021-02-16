class UpdateRecipeModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :user_id, :integer
    add_reference :recipes, :recipe_creator, foreign_key: { to_table: :users }
  end
end
