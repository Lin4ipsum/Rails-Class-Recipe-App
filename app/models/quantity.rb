class Quantity < ActiveRecord::Base
  attr_accessible :amount
  
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_many :quantities, :through => :recipe_ingredients

  validates_uniqueness_of :name, :case_senstive => false
  
end
