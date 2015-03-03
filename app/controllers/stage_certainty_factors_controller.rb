class StageCertaintyFactorsController < ApplicationController
  before_action :set_stage_certainty_factor, only: [:show, :edit, :update, :destroy]

  # GET /stage_certainty_factors
  # GET /stage_certainty_factors.json
  def index
    @stage_certainty_factors = StageCertaintyFactor.all
  end

  # GET /stage_certainty_factors/1
  # GET /stage_certainty_factors/1.json
  def show
  end

  # GET /stage_certainty_factors/new
  def new
    @stage_certainty_factor = StageCertaintyFactor.new
  end

  # GET /stage_certainty_factors/1/edit
  def edit
  end

  # POST /stage_certainty_factors
  # POST /stage_certainty_factors.json
  def create
    @stage_certainty_factor = StageCertaintyFactor.new(stage_certainty_factor_params)

    respond_to do |format|
      if @stage_certainty_factor.save
        format.html { redirect_to @stage_certainty_factor, notice: 'Stage certainty factor was successfully created.' }
        format.json { render :show, status: :created, location: @stage_certainty_factor }
      else
        format.html { render :new }
        format.json { render json: @stage_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stage_certainty_factors/1
  # PATCH/PUT /stage_certainty_factors/1.json
  def update
    respond_to do |format|
      if @stage_certainty_factor.update(stage_certainty_factor_params)
        format.html { redirect_to @stage_certainty_factor, notice: 'Stage certainty factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @stage_certainty_factor }
      else
        format.html { render :edit }
        format.json { render json: @stage_certainty_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stage_certainty_factors/1
  # DELETE /stage_certainty_factors/1.json
  def destroy
    @stage_certainty_factor.destroy
    respond_to do |format|
      format.html { redirect_to stage_certainty_factors_url, notice: 'Stage certainty factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage_certainty_factor
      @stage_certainty_factor = StageCertaintyFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_certainty_factor_params
      params.require(:stage_certainty_factor).permit(:cf, :stage_id, :disease_id)
    end
end
