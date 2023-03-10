class TelemetriesController < ApplicationController
  before_action :set_telemetry, only: %i[ show edit update destroy ]

  # GET /telemetries or /telemetries.json
  def index
    @telemetries = Telemetry.all
  end

  # GET /telemetries/1 or /telemetries/1.json
  def show
  end

  # GET /telemetries/new
  def new
    @telemetry = Telemetry.new
  end

  # GET /telemetries/1/edit
  def edit
  end

  # POST /telemetries or /telemetries.json
  def create
    @telemetry = Telemetry.new(telemetry_params)

    respond_to do |format|
      if @telemetry.save
        format.html { redirect_to telemetry_url(@telemetry), notice: "Telemetry was successfully created." }
        format.json { render :show, status: :created, location: @telemetry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @telemetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telemetries/1 or /telemetries/1.json
  def update
    respond_to do |format|
      if @telemetry.update(telemetry_params)
        format.html { redirect_to telemetry_url(@telemetry), notice: "Telemetry was successfully updated." }
        format.json { render :show, status: :ok, location: @telemetry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @telemetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telemetries/1 or /telemetries/1.json
  def destroy
    @telemetry.destroy

    respond_to do |format|
      format.html { redirect_to telemetries_url, notice: "Telemetry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telemetry
      @telemetry = Telemetry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telemetry_params
      params.require(:telemetry).permit(:tracking_id, :timestamp, :battery_level, :channel, :humidity, :light, :rssi, :temperature, :air_quality, :firmware, :model, :moving, :client_id)
    end
end
