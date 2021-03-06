class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      return 'sad' if self.nausea > self.happiness
      return 'happy' if self.happiness >= self.nausea
    end
  end
end
