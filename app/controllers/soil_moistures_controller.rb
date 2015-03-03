class SoilMoisturesController < ApplicationController
  before_action :set_soil_moisture, only: [:show, :edit, :update, :destroy]

  # GET /soil_moistures
  # GET /soil_moistures.json
  def index
    @soil_moistures = SoilMoisture.all
  end

  # GET /soil_moistures/1
  # GET /soil_moistures/1.json
  def show
  end

  # GET /soil_moistures/new
  def new
    @soil_moisture = SoilMoisture.new
  end

  # GET /soil_moistures/1/edit
  def edit
  end

  # POST /soil_moistures
  # POST /soil_moistures.json
  def create
    @soil_moisture = SoilMoisture.new(soil_moisture_params)

    respond_to do |format|
      if @soil_moisture.save
        format.html { redirect_to @soil_moisture, notice: 'Soil moisture was successfully created.' }
        format.json { render :show, status: :created, location: @soil_moisture }
      else
        format.html { render :new }
        format.json { render json: @soil_moisture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soil_moistures/1
  # PATCH/PUT /soil_moistures/1.json
  def update
    respond_to do |format|
      if @soil_moisture.update(soil_moisture_params)
        format.html { redirect_to @soil_moisture, notice: 'Soil moisture was successfully updated.' }
        format.json { render :show, status: :ok, location: @soil_moisture }
      else
        format.html { render :edit }
        format.json { render json: @soil_moisture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soil_moistures/1
  # DELETE /soil_moistures/1.json
  def destroy
    @soil_moisture.destroy
    respond_to do |format|
      format.html { redirect_to soil_moistures_url, notice: 'Soil moisture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soil_moisture
      @soil_moisture = SoilMoisture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soil_moisture_params
      params.require(:soil_moisture).permit(:min, :max, :disease_id, :cf)
    end
end
