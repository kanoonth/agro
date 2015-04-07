class ProfilesController < ApplicationController

  before_action :authenticate

  def profile
  	@user = User.find_by_username(params[:username])
  	render 'show.json'
  end
end
