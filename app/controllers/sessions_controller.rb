class SessionsController < Devise::SessionsController

  # required params username, password, remember_me
  def create
    # render :json => params
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)

    # TODO generate auth_token

    yield resource if block_given?

    respond_to do |format|
      format.html { respond_with resource, location: after_sign_in_path_for(resource) }
      format.json { render :json => resource.auth_token }
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?

    # TODO destroy auth_token

    yield if block_given?
    respond_to_on_destroy
  end

end 