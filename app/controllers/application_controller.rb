class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token, :if => :json_request?

  def authenticate
  	if request.format == 'application/json'
  		authenticate_user_with_token(params[:username], params[:auth_token])
  	else
  		authenticate_user!
  	end
  end

  def authenticate_user_with_token(username, auth_token)
  	user = User.find_by_username(username)
  	if user && user.auth_token == auth_token
      p authentication_token
  	else
  	  authenticate_user!
  	end
  end

  private

    def json_request?
      request.format == 'application/json'
    end

end
