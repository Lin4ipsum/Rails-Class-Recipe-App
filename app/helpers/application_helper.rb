module ApplicationHelper
  
   def normalize
     self.name = name.mb_chars.downcase.strip.normalize
   end
   
end
