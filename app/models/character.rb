class Character < ActiveRecord::Base
  belongs_to :show 
  belongs_to :actor
  
  def say_that_thing_you_say
    
     "#{self.name} always says: #{self.catchphrase}"
  end
  
  def build_show(name:)

    found_show =  Show.find_by({name: name})
     if found_show 
       self.show = found_show 
       self.save
       found_show
     else 
      new_show =  Show.create(name: name) 
       self.show = new_show  
       self.save
       new_show
     end
  end
  

end