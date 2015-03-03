class EcologiesController < ApplicationController
  before_action :set_ecology, only: [:show, :edit, :update, :destroy]

  # GET /ecologies
  # GET /ecologies.json
  def index
    @ecologies = Ecology.all
  end

  # GET /ecologies/1
  # GET /ecologies/1.json
  def show
  end

  # GET /ecologies/new
  def new
    @ecology = Ecology.new
  end

  # GET /ecologies/1/edit
  def edit
  end

  # POST /ecologies
  # POST /ecologies.json
  def create
    @ecology = Ecology.new(ecology_params)

    respond_to do |format|
      if @ecology.save
        format.html { redirect_to @ecology, notice: 'Ecology was successfully created.' }
        format.json { render :show, status: :created, location: @ecology }
      else
        format.html { render :new }
        format.json { render json: @ecology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ecologies/1
  # PATCH/PUT /ecologies/1.json
  def update
    respond_to do |format|
      if @ecology.update(ecology_params)
        format.html { redirect_to @ecology, notice: 'Ecology was successfully updated.' }
        format.json { render :show, status: :ok, location: @ecology }
      else
        format.html { render :edit }
        format.json { render json: @ecology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecologies/1
  # DELETE /ecologies/1.json
  def destroy
    @ecology.destroy
    respond_to do |format|
      format.html { redirect_to ecologies_url, notice: 'Ecology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecology
      @ecology = Ecology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ecology_params
      params.require(:ecology).permit(:name)
    end
end
