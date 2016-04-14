class FlashesController < ApplicationController
  before_action :set_flash, only: [:show, :edit, :update, :destroy]

  # GET /flashes
  # GET /flashes.json
  def index
    @flashes = Flash.all
  end

  # GET /flashes/1
  # GET /flashes/1.json
  def show
  end

  # GET /flashes/new
  def new
    @flash = Flash.new
  end

  # GET /flashes/1/edit
  def edit
  end

  # POST /flashes
  # POST /flashes.json
  def create
    @flash = Flash.new(flash_params)

    respond_to do |format|
      if @flash.save
        format.html { redirect_to @flash, notice: 'Flash was successfully created.' }
        format.json { render :show, status: :created, location: @flash }
      else
        format.html { render :new }
        format.json { render json: @flash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flashes/1
  # PATCH/PUT /flashes/1.json
  def update
    respond_to do |format|
      if @flash.update(flash_params)
        format.html { redirect_to @flash, notice: 'Flash was successfully updated.' }
        format.json { render :show, status: :ok, location: @flash }
      else
        format.html { render :edit }
        format.json { render json: @flash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashes/1
  # DELETE /flashes/1.json
  def destroy
    @flash.destroy
    respond_to do |format|
      format.html { redirect_to flashes_url, notice: 'Flash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash
      @flash = Flash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flash_params
      params.require(:flash).permit(:game)
    end
end
