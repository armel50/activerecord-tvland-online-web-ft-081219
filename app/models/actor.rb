class Actor < ActiveRecord::Base
  has_many :characters 
  has_many :shows, through: :characters
  
  def full_name 
    "#{self.first_name} #{self.last_name}"
    
  end
  
  def list_roles 
    self.characters.map do |character|
      character.actor_id = self.id
    
      character.save
      "#{character.name} - #{Show.find(character.show_id).name}"
    end
  end
  
end