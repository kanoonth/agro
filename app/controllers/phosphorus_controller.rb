class PhosphorusController < ApplicationController
  before_action :set_phosphoru, only: [:show, :edit, :update, :destroy]

  # GET /phosphorus
  # GET /phosphorus.json
  def index
    @phosphorus = Phosphoru.all
  end

  # GET /phosphorus/1
  # GET /phosphorus/1.json
  def show
  end

  # GET /phosphorus/new
  def new
    @phosphoru = Phosphoru.new
  end

  # GET /phosphorus/1/edit
  def edit
  end

  # POST /phosphorus
  # POST /phosphorus.json
  def create
    @phosphoru = Phosphoru.new(phosphoru_params)

    respond_to do |format|
      if @phosphoru.save
        format.html { redirect_to @phosphoru, notice: 'Phosphoru was successfully created.' }
        format.json { render :show, status: :created, location: @phosphoru }
      else
        format.html { render :new }
        format.json { render json: @phosphoru.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phosphorus/1
  # PATCH/PUT /phosphorus/1.json
  def update
    respond_to do |format|
      if @phosphoru.update(phosphoru_params)
        format.html { redirect_to @phosphoru, notice: 'Phosphoru was successfully updated.' }
        format.json { render :show, status: :ok, location: @phosphoru }
      else
        format.html { render :edit }
        format.json { render json: @phosphoru.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phosphorus/1
  # DELETE /phosphorus/1.json
  def destroy
    @phosphoru.destroy
    respond_to do |format|
      format.html { redirect_to phosphorus_url, notice: 'Phosphoru was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phosphoru
      @phosphoru = Phosphoru.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phosphoru_params
      params.require(:phosphoru).permit(:min, :max, :stage_id, :disease_id, :cf)
    end
end
