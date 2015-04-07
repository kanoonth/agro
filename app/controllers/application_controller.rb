class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  
  skip_before_filter :verify_authenticity_token, :if => :json_request?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def authenticate
  	if request.format == 'application/json'
  	  authenticate_user_with_token(params[:username], params[:auth_token])
  	else
      authenticate_user!
  	end
  end

  def authenticate_user_with_token(username, auth_token)
  	user = User.find_by_username(username)
  	if user && user.auth_token === auth_token

  	else
  	  authenticate_user!
  	end
  end

  def json_request?
    request.format == 'application/json'
  end

  private

    def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password, :password_confirmation, :first_name, :last_name, :phone_number, :identification_number) }
	end
end
