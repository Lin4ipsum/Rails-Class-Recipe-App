class RemoveQuantityIdFromRecipeIngredientsTable < ActiveRecord::Migration
  def change
     remove_column :recipe_ingredients, :quantity_id, :integer
   end
end
