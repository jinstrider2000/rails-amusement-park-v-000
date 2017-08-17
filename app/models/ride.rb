class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    messages = []

    messages << "Sorry. You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets

    if user.height < attraction.min_height
      if messages.empty?
        messages << "Sorry. You are not tall enough to ride the #{attraction.name}."
      else
        messages << "You are not tall enough to ride the #{attraction.name}."
      end
      
    end
    
    if messages.empty?
      messages << "Thanks for riding the #{attraction.name}!"
      user.update(happiness: user.happiness + attraction.happiness_rating, nausea: user.nausea + attraction.nausea_rating, tickets: user.tickets - attraction.tickets)
    end

    messages.join(" ")
  end
end
