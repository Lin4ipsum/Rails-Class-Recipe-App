class RecipeIngredient < ActiveRecord::Base
  attr_accessible :name, 
                  :amount
  
  belongs_to :ingredient, :inverse_of => :recipe_ingredients
  belongs_to :recipe, :inverse_of => :recipe_ingredients
  belongs_to :quantity, :inverse_of => :recipe_ingredients
 
  has_many :recipe_ingredients
  
  def name
    self.ingredient.name if self.ingredient
  end
  
  def name=(str)
    self.ingredient = Ingredient.find_or_create_by_name(str) if str
  end
  
  def amount
    self.quantity.amount if self.quantity  
  end
  
  def amount=(str)
    self.quantity = Quantity.find_or_create_by_amount(str) if str
  end
  
end
