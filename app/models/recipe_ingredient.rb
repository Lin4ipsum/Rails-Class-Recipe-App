class RecipeIngredient < ActiveRecord::Base
  attr_accessible :quantity_attributes,
                  :ingredient_attributes, 
                  :recipe_attributes, 
                  :name, 
                  :amount
  
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :quantity
 
  has_many :recipe_ingredients

  accepts_nested_attributes_for :recipe, :ingredient, :quantity
  
  def name
    self.ingredient.name if self.ingredient
  end
  
  def name=(str)
    self.ingredient = Ingredient.find_or_create_by_name(str) if str
  end
  
  def amount
    self.amount if self.quantity  
  end
  
  def amount=(str)
    self.quantity = Quantity.find_or_create_by_amount(str) if str
  end
  
end
