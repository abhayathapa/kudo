class StandUpsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stand_up, only: [:show, :edit, :update, :destroy]

  # GET /stand_ups
  # GET /stand_ups.json
  def index
    @stand_up = StandUp.new
    @search = StandUp.includes(:user).order('created_at DESC').ransack(params[:q])
    @stand_ups = @search.result.page(params[:page])
    attributes = %w{id name hours user date info}

    respond_to do |format|
      format.any(:html, :json) { @stand_ups }
      format.csv { send_data CsvGenerator.new(@search.result, attributes).call, filename: "logs-#{Date.today}.csv" }
    end
  end

  # GET /stand_ups/1
  # GET /stand_ups/1.json
  def show
  end

  # GET /stand_ups/new
  def new
    @stand_up = StandUp.new
  end

  # GET /stand_ups/1/edit
  def edit
    unless @stand_up.editable?(current_user)
      redirect_to stand_ups_url, notice: 'Edit not allowed' 
    end
  end

  # POST /stand_ups
  # POST /stand_ups.json
  def create
    @stand_up = StandUp.new(stand_up_params)

    respond_to do |format|
      if @stand_up.save
        format.any(:html, :js) { redirect_to stand_ups_url, status: :created, notice: 'Stand up was successfully created.' }
      else
        flash[:alert] = @stand_up.errors.full_messages.join(',')
        format.html { redirect_to stand_ups_path }
        format.json { render json: @stand_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stand_ups/1
  # PATCH/PUT /stand_ups/1.json
  def update
    respond_to do |format|
      if @stand_up.update(stand_up_params)
        format.html { redirect_to @stand_up, notice: 'Stand up was successfully updated.' }
        format.json { render :show, status: :ok, location: @stand_up }
      else
        format.html { render :edit }
        format.json { render json: @stand_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stand_ups/1
  # DELETE /stand_ups/1.json
  def destroy
    @stand_up.destroy
    respond_to do |format|
      format.html { redirect_to stand_ups_url, notice: 'Stand up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stand_up
      @stand_up = StandUp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stand_up_params
      # params.fetch(:stand_up, {}).permit(:name, :hours, :info, :user_id)
      params.require(:stand_up).permit(:name, :hours, :info, :user_id)
    end
end
