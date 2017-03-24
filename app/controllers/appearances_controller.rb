class AppearancesController < ApplicationController
  def new
    @appearance = Appearance.new
    @guest = Guest.find(params[:guest_id])
  end

  def create
    guest = Guest.find(params[:guest_id])
    episode = Episode.find_by(number: params[:appearance][:episode])
    appearance = Appearance.new(rating: params[:appearance][:rating])
    appearance.guest = guest
    appearance.episode = episode
    if appearance.save
      redirect_to episode_path(episode)
    else
      redirect_to new_guest_appearance_path(guest), alert: "There was an error in creating the appearance. Make sure the rating is between 1 and 5."
    end
  end

  # private
  #
  # def appearance_params
  #   params.require(:appearance).permit(:rating,:guest,:episode)
  # end
end
