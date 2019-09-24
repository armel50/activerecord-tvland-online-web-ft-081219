class Show < ActiveRecord::Base
  has_many :characters 
  has_many :actors, through: :characters
  
  attr_accessor :network
  
  self.network = Network.find(self.network_id)
  
  def actors_list 
    self.actors.map {|actor|"#{actor.first_name} #{actor.last_name}"}
    p self
  end
end