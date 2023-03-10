class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy
      update_presence delete_presence ]

  # GET /rooms or /rooms.json
  def index
      @client = Client.find(params[:client_id])
      @pagy, @rooms = pagy(Room.where(client_id: @client.id))
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  def update_presence
    PresenceService.new.get_presence_by_room(@room.client, @room.kio_room_id)
    respond_to do |format|
      format.html { redirect_to @room, notice: "Room presence determined." }
      format.json { head :no_content }
    end
  end

  def delete_presence
    Presence.where(kio_room_id: @room.kio_room_id).destroy_all
    respond_to do |format|
      format.html { redirect_to @room, notice: "Room presence deleted." }
      format.json { head :no_content }
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:client_id, :room_id, :name, :floor_name, :building_name)
    end
end
