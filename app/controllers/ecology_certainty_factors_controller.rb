class EcologyCertaintyFactorsController < ApplicationController
  before_action :set_ecology_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /ecology_certainty_factors
  # GET /ecology_certainty_factors.json
  def index
    @ecology_certainty_factors = EcologyCertaintyFactor.all
  end

  # GET /ecology_certainty_factors/1
  # GET /ecology_certainty_factors/1.json
  def show
  end

  # GET /ecology_certainty_factors/new
  def new
    @ecology_certainty_factor = EcologyCertaintyFactor.new
  end

  # GET /ecology_certainty_factors/1/edit
  def edit
  end

  # POST /ecology_certainty_factors
  # POST /ecology_certainty_factors.json
  def create
    @ecology_certainty_factor = EcologyCertaintyFactor.new(ecology_certainty_factor_params)

    respond_to do |format|
      if @ecology_certainty_factor.save
        format.html { redirect_to @ecology_certainty_factor, notice: 'Ecology certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @ecology_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @ecology_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ecology_certainty_factors/1
  # PATCH/PUT /ecology_certainty_factors/1.json
  def update
    respond_to do |format|
      if @ecology_certainty_factor.update(ecology_certainty_factor_params)
        format.html { redirect_to @ecology_certainty_factor, notice: 'Ecology certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @ecology_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @ecology_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecology_certainty_factors/1
  # DELETE /ecology_certainty_factors/1.json
  def destroy
    @ecology_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to ecology_certainty_factors_url, notice: 'Ecology certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecology_certainty_factor
      @ecology_certainty_factor = EcologyCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ecology_certainty_factor_params
      params.require(:ecology_certainty_factor).permit(:disease_id, :ecology_id, :cf)
    end
end
