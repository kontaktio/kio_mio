class ClientsController < ApplicationController
  before_action :authenticate_user!, except: [:login]

  before_action :set_client, only: %i[ show edit update destroy reset get_all]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  def reset
    Floor.where(client_id: @client.id).delete_all
    Building.where(client_id: @client.id).delete_all
    Room.where(client_id: @client.id).delete_all
    Device.where(client_id: @client.id).delete_all

    respond_to do |format|
      format.html { redirect_to @client, notice: "Client was successfully reset." }
      format.json { head :no_content }
    end
  end

  def get_all
    SetupJob.perform_async(@client)
    respond_to do |format|
      format.html { redirect_to @client, notice: "Client being set up..." }
      format.json { head :no_content }
    end
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :api_key, :user, :pass)
    end

end
