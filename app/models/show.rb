class Show < ActiveRecord::Base
  has_many :characters 
  has_many :actors, through: :characters
  
  attr_accessor :network
 
  def actors_list 
    self.actors.map {|actor|"#{actor.first_name} #{actor.last_name}"}
    
  end 
  
  def build_network(call_letters: )
    found = Network.find_by(call_letters: call_letters) 
    
    # if found 
      
    # else
    #   Network.create(call_letters: call_letters)
  
    # end
    
  end
end