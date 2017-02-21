class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets? && !tall_enough?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

    if !enough_tickets?
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end

    if !tall_enough?
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    end

    get_on_ride
    return "Thanks for riding the #{self.attraction.name}!"
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough?
    self.user.height > self.attraction.min_height
  end

  def get_on_ride
    self.user.tickets = self.user.tickets - self.attraction.tickets
    self.user.nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.save
    self.attraction.save
  end

end
