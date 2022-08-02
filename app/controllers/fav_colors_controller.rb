class FavColorsController < ApplicationController
  before_action :set_fav_color, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [] # [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /fav_colors or /fav_colors.json
  def index
    @fav_colors = FavColor.all
  end

  # GET /fav_colors/1 or /fav_colors/1.json
  def show
  end

  # GET /fav_colors/new
  def new
    #@fav_color = FavColor.new
    @fav_color = current_user.fav_colors.build
  end

  # GET /fav_colors/1/edit
  def edit
  end

  # POST /fav_colors or /fav_colors.json
  def create
    #@fav_color = FavColor.new(fav_color_params)
    @fav_color = current_user.fav_colors.build(fav_color_params)

    respond_to do |format|
      if @fav_color.save
        format.html { redirect_to fav_color_url(@fav_color), notice: "Fav color was successfully created." }
        format.json { render :show, status: :created, location: @fav_color }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fav_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fav_colors/1 or /fav_colors/1.json
  def update
    respond_to do |format|
      if @fav_color.update(fav_color_params)
        format.html { redirect_to fav_color_url(@fav_color), notice: "Fav color was successfully updated." }
        format.json { render :show, status: :ok, location: @fav_color }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fav_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fav_colors/1 or /fav_colors/1.json
  def destroy
    @fav_color.destroy

    respond_to do |format|
      format.html { redirect_to fav_colors_url, notice: "Fav color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.fav_colors.find_by(id: params[:id])
    redirect_to fav_colors_path, notice: "You're not allowed to do that." if @friend.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fav_color
      @fav_color = FavColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fav_color_params
      params.require(:fav_color).permit(:first_name, :last_name, :color, :user_id)
    end
end
