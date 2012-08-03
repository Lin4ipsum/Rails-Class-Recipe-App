class Quantity < ActiveRecord::Base
  attr_accessible :amount, :recipe_ingredients_attributes
  
  has_many :recipe_ingredients
  
  accepts_nested_attributes_for :recipe_ingredients
  
#  before_save :normalize
  
  private
    def normalize
      self.amount = self.amount.downcase.strip if self.amount
    end
end
