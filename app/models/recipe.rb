class Recipe < ActiveRecord::Base
  attr_accessible :description,
                  :name,
                  :recipe_ingredients_attributes
  
  has_many :recipe_ingredients, :dependent => :destroy

  accepts_nested_attributes_for :recipe_ingredients, 
                                :allow_destroy => true,
                                :reject_if => lambda { |a| a[:name].blank? },
                                :reject_if => lambda { |a| a[:amount].blank? }
end
