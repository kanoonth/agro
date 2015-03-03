class RegionCertaintyFactorsController < ApplicationController
  before_action :set_region_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /region_certainty_factors
  # GET /region_certainty_factors.json
  def index
    @region_certainty_factors = RegionCertaintyFactor.all
  end

  # GET /region_certainty_factors/1
  # GET /region_certainty_factors/1.json
  def show
  end

  # GET /region_certainty_factors/new
  def new
    @region_certainty_factor = RegionCertaintyFactor.new
  end

  # GET /region_certainty_factors/1/edit
  def edit
  end

  # POST /region_certainty_factors
  # POST /region_certainty_factors.json
  def create
    @region_certainty_factor = RegionCertaintyFactor.new(region_certainty_factor_params)

    respond_to do |format|
      if @region_certainty_factor.save
        format.html { redirect_to @region_certainty_factor, notice: 'Region certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @region_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @region_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /region_certainty_factors/1
  # PATCH/PUT /region_certainty_factors/1.json
  def update
    respond_to do |format|
      if @region_certainty_factor.update(region_certainty_factor_params)
        format.html { redirect_to @region_certainty_factor, notice: 'Region certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @region_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @region_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /region_certainty_factors/1
  # DELETE /region_certainty_factors/1.json
  def destroy
    @region_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to region_certainty_factors_url, notice: 'Region certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_certainty_factor
      @region_certainty_factor = RegionCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_certainty_factor_params
      params.require(:region_certainty_factor).permit(:region_id, :disease_id)
    end
end
