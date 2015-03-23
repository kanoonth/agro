class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
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
    age = params[:age]
    phosphoru = params[:phosphoru]
    nitrogen = params[:nitrogen]
    potassium = params[:potassium]
    temperature = params[:temperature]
    rain = params[:rain]
    wind = params[:wind]
    air_moisture = params[:air_moisture]
    soil_moisture = params[:soil_moisture]
    region_name = params[:notification][:region_name]
    ecology_name = params[:notification][:ecology_name]
    area_type_name = params[:notification][:area_type_name]
    plantation_name = params[:notification][:plantation_name]
    soil_type_name = params[:notification][:soil_type_name]

    # render :json => Notification.predict(age,phosphoru,nitrogen,potassium,temperature,rain,wind,air_moisture,soil_moisture,
    #   region_name,ecology_name,area_type_name,plantation_name,soil_type_name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :disease_id, :cf)
    end
end
