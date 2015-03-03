class PlanationsController < ApplicationController
  before_action :set_planation, only: [:show, :edit, :update, :destroy]

  # GET /planations
  # GET /planations.json
  def index
    @planations = Planation.all
  end

  # GET /planations/1
  # GET /planations/1.json
  def show
  end

  # GET /planations/new
  def new
    @planation = Planation.new
  end

  # GET /planations/1/edit
  def edit
  end

  # POST /planations
  # POST /planations.json
  def create
    @planation = Planation.new(planation_params)

    respond_to do |format|
      if @planation.save
        format.html { redirect_to @planation, notice: 'Planation was successfully created.' }
        format.json { render :show, status: :created, location: @planation }
      else
        format.html { render :new }
        format.json { render json: @planation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planations/1
  # PATCH/PUT /planations/1.json
  def update
    respond_to do |format|
      if @planation.update(planation_params)
        format.html { redirect_to @planation, notice: 'Planation was successfully updated.' }
        format.json { render :show, status: :ok, location: @planation }
      else
        format.html { render :edit }
        format.json { render json: @planation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planations/1
  # DELETE /planations/1.json
  def destroy
    @planation.destroy
    respond_to do |format|
      format.html { redirect_to planations_url, notice: 'Planation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planation
      @planation = Planation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planation_params
      params.require(:planation).permit(:name)
    end
end
