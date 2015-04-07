class ProfilesController < ApplicationController

  before_action :authenticate, only: [:profile]

  def profile
  	@user = User.find_by_username(params[:username])
  	render 'show.json'
  end

  def home
  	render :home
  end
end
