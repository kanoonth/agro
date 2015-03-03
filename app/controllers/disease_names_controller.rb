class DiseaseNamesController < ApplicationController
  before_action :set_disease_name, only: [:show, :edit, :update, :destroy]

  # GET /disease_names
  # GET /disease_names.json
  def index
    @disease_names = DiseaseName.all
  end

  # GET /disease_names/1
  # GET /disease_names/1.json
  def show
  end

  # GET /disease_names/new
  def new
    @disease_name = DiseaseName.new
  end

  # GET /disease_names/1/edit
  def edit
  end

  # POST /disease_names
  # POST /disease_names.json
  def create
    @disease_name = DiseaseName.new(disease_name_params)

    respond_to do |format|
      if @disease_name.save
        format.html { redirect_to @disease_name, notice: 'Disease name was successfully created.' }
        format.json { render :show, status: :created, location: @disease_name }
      else
        format.html { render :new }
        format.json { render json: @disease_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disease_names/1
  # PATCH/PUT /disease_names/1.json
  def update
    respond_to do |format|
      if @disease_name.update(disease_name_params)
        format.html { redirect_to @disease_name, notice: 'Disease name was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease_name }
      else
        format.html { render :edit }
        format.json { render json: @disease_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disease_names/1
  # DELETE /disease_names/1.json
  def destroy
    @disease_name.destroy
    respond_to do |format|
      format.html { redirect_to disease_names_url, notice: 'Disease name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disease_name
      @disease_name = DiseaseName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_name_params
      params.require(:disease_name).permit(:name, :disease_id)
    end
end
