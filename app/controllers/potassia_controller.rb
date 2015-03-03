class PotassiaController < ApplicationController
  before_action :set_potassium, only: [:show, :edit, :update, :destroy]

  # GET /potassia
  # GET /potassia.json
  def index
    @potassia = Potassium.all
  end

  # GET /potassia/1
  # GET /potassia/1.json
  def show
  end

  # GET /potassia/new
  def new
    @potassium = Potassium.new
  end

  # GET /potassia/1/edit
  def edit
  end

  # POST /potassia
  # POST /potassia.json
  def create
    @potassium = Potassium.new(potassium_params)

    respond_to do |format|
      if @potassium.save
        format.html { redirect_to @potassium, notice: 'Potassium was successfully created.' }
        format.json { render :show, status: :created, location: @potassium }
      else
        format.html { render :new }
        format.json { render json: @potassium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /potassia/1
  # PATCH/PUT /potassia/1.json
  def update
    respond_to do |format|
      if @potassium.update(potassium_params)
        format.html { redirect_to @potassium, notice: 'Potassium was successfully updated.' }
        format.json { render :show, status: :ok, location: @potassium }
      else
        format.html { render :edit }
        format.json { render json: @potassium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potassia/1
  # DELETE /potassia/1.json
  def destroy
    @potassium.destroy
    respond_to do |format|
      format.html { redirect_to potassia_url, notice: 'Potassium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potassium
      @potassium = Potassium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potassium_params
      params.require(:potassium).permit(:min, :max, :stage_id, :disease_id, :cf)
    end
end
