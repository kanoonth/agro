class CultivatedAreasController < ApplicationController
  before_action :authenticate
  before_action :set_cultivated_area, only: [:show, :edit, :update, :destroy]

  # GET /cultivated_areas
  # GET /cultivated_areas.json
  def index
    user = current_user
    if current_user.nil? and params[:username]
      user = User.find_by_username( params[:username] )
    end
    @cultivated_areas = CultivatedArea.where(user: user)
  end

  # GET /cultivated_areas/1
  # GET /cultivated_areas/1.json
  def show
  end

  # GET /cultivated_areas/new
  def new
    @cultivated_area = CultivatedArea.new
    @plantations = Plantation.all
  end

  # GET /cultivated_areas/1/edit
  def edit
    @plantations = Plantation.all
  end

  # POST /cultivated_areas
  # POST /cultivated_areas.json
  def create
    @cultivated_area = CultivatedArea.new(cultivated_area_params)

    user = current_user
    if current_user.nil? and params[:username]
      user = User.find_by_username( params[:username] )
    end

    @cultivated_area.user = user

    respond_to do |format|
      if @cultivated_area.save
        format.html { redirect_to @cultivated_area, notice: 'Cultivated area was successfully created.' }
        format.json { render :show, status: :created, location: @cultivated_area }
      else
        format.html { render :new }
        format.json { render json: @cultivated_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cultivated_areas/1
  # PATCH/PUT /cultivated_areas/1.json
  def update
    respond_to do |format|
      if @cultivated_area.update(cultivated_area_params)
        format.html { redirect_to @cultivated_area, notice: 'Cultivated area was successfully updated.' }
        format.json { render :show, status: :ok, location: @cultivated_area }
      else
        format.html { render :edit }
        format.json { render json: @cultivated_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cultivated_areas/1
  # DELETE /cultivated_areas/1.json
  def destroy
    @cultivated_area.destroy
    respond_to do |format|
      format.html { redirect_to cultivated_areas_url, notice: 'Cultivated area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cultivated_area
      @cultivated_area = CultivatedArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cultivated_area_params
      params.require(:cultivated_area).permit(:name, :latitude, :longitude, :plantation_id, :plantation_date)
    end
end
