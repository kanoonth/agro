class SoilTypeCertaintyFactorsController < ApplicationController
  before_action :set_soil_type_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /soil_type_certainty_factors
  # GET /soil_type_certainty_factors.json
  def index
    @soil_type_certainty_factors = SoilTypeCertaintyFactor.all
  end

  # GET /soil_type_certainty_factors/1
  # GET /soil_type_certainty_factors/1.json
  def show
  end

  # GET /soil_type_certainty_factors/new
  def new
    @soil_type_certainty_factor = SoilTypeCertaintyFactor.new
  end

  # GET /soil_type_certainty_factors/1/edit
  def edit
  end

  # POST /soil_type_certainty_factors
  # POST /soil_type_certainty_factors.json
  def create
    @soil_type_certainty_factor = SoilTypeCertaintyFactor.new(soil_type_certainty_factor_params)

    respond_to do |format|
      if @soil_type_certainty_factor.save
        format.html { redirect_to @soil_type_certainty_factor, notice: 'Soil type certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @soil_type_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @soil_type_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soil_type_certainty_factors/1
  # PATCH/PUT /soil_type_certainty_factors/1.json
  def update
    respond_to do |format|
      if @soil_type_certainty_factor.update(soil_type_certainty_factor_params)
        format.html { redirect_to @soil_type_certainty_factor, notice: 'Soil type certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @soil_type_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @soil_type_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soil_type_certainty_factors/1
  # DELETE /soil_type_certainty_factors/1.json
  def destroy
    @soil_type_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to soil_type_certainty_factors_url, notice: 'Soil type certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soil_type_certainty_factor
      @soil_type_certainty_factor = SoilTypeCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soil_type_certainty_factor_params
      params.require(:soil_type_certainty_factor).permit(:disease_id, :soil_type_id)
    end
end
