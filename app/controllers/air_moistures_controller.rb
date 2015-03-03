class AirMoisturesController < ApplicationController
  before_action :set_air_moisture, only: [:show, :edit, :update, :destroy]

  # GET /air_moistures
  # GET /air_moistures.json
  def index
    @air_moistures = AirMoisture.all
  end

  # GET /air_moistures/1
  # GET /air_moistures/1.json
  def show
  end

  # GET /air_moistures/new
  def new
    @air_moisture = AirMoisture.new
  end

  # GET /air_moistures/1/edit
  def edit
  end

  # POST /air_moistures
  # POST /air_moistures.json
  def create
    @air_moisture = AirMoisture.new(air_moisture_params)

    respond_to do |format|
      if @air_moisture.save
        format.html { redirect_to @air_moisture, notice: 'Air moisture was successfully created.' }
        format.json { render :show, status: :created, location: @air_moisture }
      else
        format.html { render :new }
        format.json { render json: @air_moisture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /air_moistures/1
  # PATCH/PUT /air_moistures/1.json
  def update
    respond_to do |format|
      if @air_moisture.update(air_moisture_params)
        format.html { redirect_to @air_moisture, notice: 'Air moisture was successfully updated.' }
        format.json { render :show, status: :ok, location: @air_moisture }
      else
        format.html { render :edit }
        format.json { render json: @air_moisture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /air_moistures/1
  # DELETE /air_moistures/1.json
  def destroy
    @air_moisture.destroy
    respond_to do |format|
      format.html { redirect_to air_moistures_url, notice: 'Air moisture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_air_moisture
      @air_moisture = AirMoisture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def air_moisture_params
      params.require(:air_moisture).permit(:min, :max, :disease_id, :cf)
    end
end
