class EgzamsController < ApplicationController
  before_action :set_egzam, only: %w[ show edit update destroy ]

  # GET /egzams
  # GET /egzams.json
  def index
    @egzams = Egzam.all
  end

  # GET /egzams/1
  # GET /egzams/1.json
  def show
  end

  # GET /egzams/new
  def new
    @egzam = Egzam.new
  end

  # GET /egzams/1/edit
  def edit
  end

  # POST /egzams
  # POST /egzams.json
  def create
    @egzam = Egzam.new(egzam_params)

    respond_to do |format|
      if @egzam.save
        format.html { redirect_to @egzam, notice: "Egzam was successfully created." }
        format.json { render :show, status: :created, location: @egzam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @egzam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /egzams/1
  # PATCH/PUT /egzams/1.json
  def update
    respond_to do |format|
      if @egzam.update(egzam_params)
        format.html { redirect_to @egzam, notice: "Egzam was successfully updated." }
        format.json { render :show, status: :ok, location: @egzam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @egzam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /egzams/1
  # DELETE /egzams/1.json
  def destroy
    @egzam.destroy
    respond_to do |format|
      format.html { redirect_to egzams_url, notice: "Egzam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_egzam
      @egzam = Egzam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def egzam_params
      params.require(:egzam).permit(:user_id, :question_id)
    end
end
