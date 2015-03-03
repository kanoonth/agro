class NitrogensController < ApplicationController
  before_action :set_nitrogen, only: [:show, :edit, :update, :destroy]

  # GET /nitrogens
  # GET /nitrogens.json
  def index
    @nitrogens = Nitrogen.all
  end

  # GET /nitrogens/1
  # GET /nitrogens/1.json
  def show
  end

  # GET /nitrogens/new
  def new
    @nitrogen = Nitrogen.new
  end

  # GET /nitrogens/1/edit
  def edit
  end

  # POST /nitrogens
  # POST /nitrogens.json
  def create
    @nitrogen = Nitrogen.new(nitrogen_params)

    respond_to do |format|
      if @nitrogen.save
        format.html { redirect_to @nitrogen, notice: 'Nitrogen was successfully created.' }
        format.json { render :show, status: :created, location: @nitrogen }
      else
        format.html { render :new }
        format.json { render json: @nitrogen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nitrogens/1
  # PATCH/PUT /nitrogens/1.json
  def update
    respond_to do |format|
      if @nitrogen.update(nitrogen_params)
        format.html { redirect_to @nitrogen, notice: 'Nitrogen was successfully updated.' }
        format.json { render :show, status: :ok, location: @nitrogen }
      else
        format.html { render :edit }
        format.json { render json: @nitrogen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nitrogens/1
  # DELETE /nitrogens/1.json
  def destroy
    render :json => @nitrogen
    # @nitrogen.destroy
    # respond_to do |format|
    #   format.html { redirect_to nitrogens_url, notice: 'Nitrogen was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nitrogen
      @nitrogen = Nitrogen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nitrogen_params
      params.require(:nitrogen).permit(:min, :max, :stage_id, :disease_id, :cf)
    end
end
