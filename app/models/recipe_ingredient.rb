class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :quantity_id
  
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :quantity

end
