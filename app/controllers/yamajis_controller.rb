class YamajisController < ApplicationController
  before_action :set_yamaji, only: [:show, :edit, :update, :destroy]

  # GET /yamajis
  # GET /yamajis.json
  def index
    @yamajis = Yamaji.all
  end

  # GET /yamajis/1
  # GET /yamajis/1.json
  def show
  end

  # GET /yamajis/new
  def new
    @yamaji = Yamaji.new
  end

  # GET /yamajis/1/edit
  def edit
  end

  # POST /yamajis
  # POST /yamajis.json
  def create
    @yamaji = Yamaji.new(yamaji_params)

    respond_to do |format|
      if @yamaji.save
        format.html { redirect_to @yamaji, notice: 'Yamaji was successfully created.' }
        format.json { render :show, status: :created, location: @yamaji }
      else
        format.html { render :new }
        format.json { render json: @yamaji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yamajis/1
  # PATCH/PUT /yamajis/1.json
  def update
    respond_to do |format|
      if @yamaji.update(yamaji_params)
        format.html { redirect_to @yamaji, notice: 'Yamaji was successfully updated.' }
        format.json { render :show, status: :ok, location: @yamaji }
      else
        format.html { render :edit }
        format.json { render json: @yamaji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yamajis/1
  # DELETE /yamajis/1.json
  def destroy
    @yamaji.destroy
    respond_to do |format|
      format.html { redirect_to yamajis_url, notice: 'Yamaji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yamaji
      @yamaji = Yamaji.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yamaji_params
      params.require(:yamaji).permit(:name, :mail, :updated_at)
    end
end
