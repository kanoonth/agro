class RegistrationsController < Devise::RegistrationsController
  # required params username, password, password_confirmation
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_to do |format|
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
          format.json { render :json => resource }
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!

        respond_to do |format|
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource) }
          format.json { render :json => resource.inactive_message, :status => :unauthorized }
        end
      end
    else
      clean_up_passwords resource
      set_minimum_password_length

      respond_to do |format|
          format.html { respond_with resource }
          format.json { render :json => resource }
      end
    end
  end

  # required params username, password, password_confirmation, current_password
  def update
  	unless json_request?
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    end

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_to do |format|
        format.html { respond_with resource, location: after_update_path_for(resource) }
        format.json { render :json => resource }
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def destroy
  	super unless json_request?
  end

  def authenticate_scope!
    unless json_request?
      send(:"authenticate_#{resource_name}!", force: true)
      self.resource = send(:"current_#{resource_name}") 
    else
      current = User.find_by_username(params[:user][:username])
      self.resource = current
    end
  end

  private 

    def json_request?
      request.format == 'application/json'
    end
end 