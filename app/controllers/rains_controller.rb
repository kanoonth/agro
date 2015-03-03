class RainsController < ApplicationController
  before_action :set_rain, only: [:show, :edit, :update, :destroy]

  # GET /rains
  # GET /rains.json
  def index
    @rains = Rain.all
  end

  # GET /rains/1
  # GET /rains/1.json
  def show
  end

  # GET /rains/new
  def new
    @rain = Rain.new
  end

  # GET /rains/1/edit
  def edit
  end

  # POST /rains
  # POST /rains.json
  def create
    @rain = Rain.new(rain_params)

    respond_to do |format|
      if @rain.save
        format.html { redirect_to @rain, notice: 'Rain was successfully created.' }
        format.json { render :show, status: :created, location: @rain }
      else
        format.html { render :new }
        format.json { render json: @rain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rains/1
  # PATCH/PUT /rains/1.json
  def update
    respond_to do |format|
      if @rain.update(rain_params)
        format.html { redirect_to @rain, notice: 'Rain was successfully updated.' }
        format.json { render :show, status: :ok, location: @rain }
      else
        format.html { render :edit }
        format.json { render json: @rain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rains/1
  # DELETE /rains/1.json
  def destroy
    @rain.destroy
    respond_to do |format|
      format.html { redirect_to rains_url, notice: 'Rain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rain
      @rain = Rain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rain_params
      params.require(:rain).permit(:min, :max, :disease_id, :cf)
    end
end
