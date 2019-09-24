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
  
  # def build_network(call_letters:)  
  #   found_net = Network.find_by(call_letters: call_letters) 
  #   if found_net
  #     self.network_id = found_net
  #     self.save
  #   else
  #     new_net =  Network.create(call_letters: call_letters)
  #     self.network_id = new_net
  #     self.save
  #   end
  # end
end