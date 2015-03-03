class AreaTypeCertaintyFactorsController < ApplicationController
  before_action :set_area_type_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /area_type_certainty_factors
  # GET /area_type_certainty_factors.json
  def index
    @area_type_certainty_factors = AreaTypeCertaintyFactor.all
  end

  # GET /area_type_certainty_factors/1
  # GET /area_type_certainty_factors/1.json
  def show
  end

  # GET /area_type_certainty_factors/new
  def new
    @area_type_certainty_factor = AreaTypeCertaintyFactor.new
  end

  # GET /area_type_certainty_factors/1/edit
  def edit
  end

  # POST /area_type_certainty_factors
  # POST /area_type_certainty_factors.json
  def create
    @area_type_certainty_factor = AreaTypeCertaintyFactor.new(area_type_certainty_factor_params)

    respond_to do |format|
      if @area_type_certainty_factor.save
        format.html { redirect_to @area_type_certainty_factor, notice: 'Area type certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @area_type_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @area_type_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_type_certainty_factors/1
  # PATCH/PUT /area_type_certainty_factors/1.json
  def update
    respond_to do |format|
      if @area_type_certainty_factor.update(area_type_certainty_factor_params)
        format.html { redirect_to @area_type_certainty_factor, notice: 'Area type certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_type_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @area_type_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_type_certainty_factors/1
  # DELETE /area_type_certainty_factors/1.json
  def destroy
    @area_type_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to area_type_certainty_factors_url, notice: 'Area type certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_type_certainty_factor
      @area_type_certainty_factor = AreaTypeCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_type_certainty_factor_params
      params.require(:area_type_certainty_factor).permit(:disease_id, :area_type_id, :cf)
    end
end
