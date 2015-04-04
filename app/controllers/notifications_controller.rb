class NotificationsController < ApplicationController
  before_action :authenticate, except: [:predict]
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    if json_request? and params[:username]
      user = User.find_by_username( params[:username] )
      cultivated_areas = user.cultivated_areas
    else
      cultivated_areas = current_user.cultivated_areas
    end
    @notifications = []
    cultivated_areas.each do |cultivated_area|
      @notifications << Notification.where(cultivated_area: cultivated_area)
    end
    @notifications.flatten!
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @contents = Content.where(disease_id: @notification.disease.id)
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
    @diseases = Disease.all
    @cultivated_areas = CultivatedArea.where(user: current_user)
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def predict
    @regions = Region.all
    @ecologies = Ecology.all
    @area_types = AreaType.all
    @plantations = Plantation.all
    @soil_types = SoilType.all
  end

  def get_predicted_diseases
    factor = {}
    factor['age'] = params[:age]
    factor['phosphoru'] = params[:phosphoru]
    factor['nitrogen'] = params[:nitrogen]
    factor['potassium'] = params[:potassium]
    factor['temperature'] = params[:temperature]
    factor['rain'] = params[:rain]
    factor['wind'] = params[:wind]
    factor['air_moisture'] = params[:air_moisture]
    factor['soil_moisture'] = params[:soil_moisture]
    factor['region_name'] = params[:notification][:region_name]
    factor['ecology_name'] = params[:notification][:ecology_name]
    factor['area_type_name'] = params[:notification][:area_type_name]
    factor['plantation_name'] = params[:notification][:plantation_name]
    factor['soil_type_name'] = params[:notification][:soil_type_name]

    render :json => Notification.predict(factor)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:cultivated_area_id, :disease_id, :cf)
    end
end
