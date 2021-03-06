class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_ingredients_attributes
  
  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients
 
  accepts_nested_attributes_for :recipe_ingredients
 
 # before_save :normalize


   def normalize
     self.name = self.name.downcase.strip if self.name
   end
  
end
