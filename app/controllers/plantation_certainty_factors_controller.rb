class PlantationCertaintyFactorsController < ApplicationController
  before_action :set_plantation_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /plantation_certainty_factors
  # GET /plantation_certainty_factors.json
  def index
    @plantation_certainty_factors = PlantationCertaintyFactor.all
  end

  # GET /plantation_certainty_factors/1
  # GET /plantation_certainty_factors/1.json
  def show
  end

  # GET /plantation_certainty_factors/new
  def new
    @plantation_certainty_factor = PlantationCertaintyFactor.new
  end

  # GET /plantation_certainty_factors/1/edit
  def edit
  end

  # POST /plantation_certainty_factors
  # POST /plantation_certainty_factors.json
  def create
    @plantation_certainty_factor = PlantationCertaintyFactor.new(plantation_certainty_factor_params)

    respond_to do |format|
      if @plantation_certainty_factor.save
        format.html { redirect_to @plantation_certainty_factor, notice: 'Plantation certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @plantation_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @plantation_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plantation_certainty_factors/1
  # PATCH/PUT /plantation_certainty_factors/1.json
  def update
    respond_to do |format|
      if @plantation_certainty_factor.update(plantation_certainty_factor_params)
        format.html { redirect_to @plantation_certainty_factor, notice: 'Plantation certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @plantation_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @plantation_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantation_certainty_factors/1
  # DELETE /plantation_certainty_factors/1.json
  def destroy
    @plantation_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to plantation_certainty_factors_url, notice: 'Plantation certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantation_certainty_factor
      @plantation_certainty_factor = PlantationCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plantation_certainty_factor_params
      params.require(:plantation_certainty_factor).permit(:disease_id, :plantation_id, :cf)
    end
end
