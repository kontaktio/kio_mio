class DevicesController < ApplicationController
  before_action :set_device, only: %i[ show edit update destroy
    update_presence update_positions delete_presence]

  # GET /devices or /devices.json
  def index
    @client = Client.find(params[:client_id])

    # binding.break
    @last_seen = params["last_seen"] || 7
    params["device_type"].blank? ? @device_type = 1 : @device_type = params["device_type"].to_i

    case params["device_type"].to_i
    when 2
      @devices = @client.devices.gateways
    when 3
      @devices = @client.devices.portal_beams
    when 4
      @devices = @client.devices.beacons
    when 5
      @devices = @client.devices.tags
    else
      @devices = @client.devices
    end

    unless @last_seen.nil? || @last_seen.blank?
      ls = DateTime.now
      ls = ls - @last_seen.to_i.days
      @devices = @devices.where("last_seen > ?", ls)
    end
  end

  def update_presence
    PresenceJob.perform_async(@device.client, @device.mac)
    # PresenceService.new.get_presence(@device.client, @device.mac)
    respond_to do |format|
      format.html { redirect_to @device, notice: "Device presence determined." }
      format.json { head :no_content }
    end
  end

  def update_positions
    PositionsService.new.get_positions(@device.client, @device.mac)
    respond_to do |format|
      format.html { redirect_to @device, notice: "Device locations determined." }
      format.json { head :no_content }
    end
  end

  def delete_presence
    @device.presences.destroy_all

    respond_to do |format|
      format.html { redirect_to @device, notice: "Device locations deleted." }
      format.json { head :no_content }
    end
  end

  def add_devices
    @client = Client.find(params[:client_id])

    DeviceJob.perform_async(@client)

    respond_to do |format|
      format.html { redirect_to @client, notice: "Device locations determined." }
      format.json { head :no_content }
    end
  end


  # GET /devices/1 or /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices or /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to device_url(@device), notice: "Device was successfully created." }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1 or /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to device_url(@device), notice: "Device was successfully updated." }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1 or /devices/1.json
  def destroy
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url, notice: "Device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def device_params
      params.require(:device).permit(:client_id, :kio_device_id, :unique_id, :device_type, :model, :product, :firmware, :order_id)
    end
end
