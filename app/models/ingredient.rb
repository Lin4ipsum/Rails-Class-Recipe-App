class Ingredient < ActiveRecord::Base
  attr_accessible :name
  
  validates_uniqueness_of :name, :case_senstive => false
  
  before_save :normalize
  
  
  def normalize
    self.name = name.mb_chars.downcase.strip.normalize
  end
  
  
end
