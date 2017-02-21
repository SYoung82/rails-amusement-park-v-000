class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id] )
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end
end
