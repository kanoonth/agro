require 'digest'

class SessionsController < Devise::SessionsController

  # required params username, password, remember_me
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)

    yield resource if block_given?

    respond_to do |format|
      format.html { respond_with resource, location: after_sign_in_path_for(resource) }
      format.json do 
        resource.auth_token = Digest::SHA1.hexdigest([Time.now, rand].join)
        resource.save!
        render :json => resource.auth_token
      end
    end
  end

  def json_destroy
    resource = User.find_by_username request.headers['X-User-Username']
    resource.auth_token = nil
    resource.save
  end

  private 
    def verify_signed_out_user
      if json_request?
        json_destroy
      end
      if all_signed_out?
        set_flash_message :notice, :already_signed_out if is_flashing_format?

        respond_to_on_destroy
      end
    end

    def json_request?
      request.format == 'application/json'
    end

end 