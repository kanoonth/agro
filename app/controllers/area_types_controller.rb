class AreaTypesController < ApplicationController
  before_action :set_area_type, only: [:show, :edit, :update, :destroy]

  # GET /area_types
  # GET /area_types.json
  def index
    @area_types = AreaType.all
  end

  # GET /area_types/1
  # GET /area_types/1.json
  def show
  end

  # GET /area_types/new
  def new
    @area_type = AreaType.new
  end

  # GET /area_types/1/edit
  def edit
  end

  # POST /area_types
  # POST /area_types.json
  def create
    @area_type = AreaType.new(area_type_params)

    respond_to do |format|
      if @area_type.save
        format.html { redirect_to @area_type, notice: 'Area type was successfully created.' }
        format.json { render :show, status: :created, location: @area_type }
      else
        format.html { render :new }
        format.json { render json: @area_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_types/1
  # PATCH/PUT /area_types/1.json
  def update
    respond_to do |format|
      if @area_type.update(area_type_params)
        format.html { redirect_to @area_type, notice: 'Area type was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_type }
      else
        format.html { render :edit }
        format.json { render json: @area_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_types/1
  # DELETE /area_types/1.json
  def destroy
    @area_type.destroy
    respond_to do |format|
      format.html { redirect_to area_types_url, notice: 'Area type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_type
      @area_type = AreaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_type_params
      params.require(:area_type).permit(:name)
    end
end
