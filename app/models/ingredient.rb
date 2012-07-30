class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_ingredients_attributes
  
  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients
 
  accepts_nested_attributes_for :recipe_ingredients
 
  validates_uniqueness_of :name, :case_senstive => false
  
  before_save :normalize
  
  def normalize
    self.name = name.mb_chars.downcase.strip.normalize
  end
  
  
end
