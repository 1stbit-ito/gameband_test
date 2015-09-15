class GameProfilesController < ApplicationController
  before_action :set_game_profile, only: [:show, :edit, :update, :destroy]

  # GET /game_profiles
  # GET /game_profiles.json
  def index
    @game_profiles = GameProfile.where("user_id = ? and delete_flag = 0", params[:user_id])
    @ret = {
      :ret => 1,
      :game_profiles => @game_profiles
    }
    render :index, location: @ret

  end

  # GET /game_profiles/1
  # GET /game_profiles/1.json
  def show
  end

  # GET /game_profiles/new/?user_id=aaa&game_id=1
  def new
    
    @game_profile = GameProfile.new
    @game_profile.user_id = params[:user_id] 
    @game_profile.game_id = params[:game_id] 
    @game = Game.find(params[:game_id])

    logger.debug "--------------------------------"
    logger.debug @game.inspect
    logger.debug "--------------------------------"
    
  end

  # GET /game_profiles/1/edit
  def edit
  end

  # POST /game_profiles
  # POST /game_profiles.json
  def create
    @game_profile = GameProfile.new(create_game_profile_params)

    respond_to do |format|
      if @game_profile.save
        format.html { redirect_to @game_profile, notice: 'Game profile was successfully created.' }
        format.json { render :show, status: :created, location: @game_profile }
      else
        format.html { render :new }
        format.json { render json: @game_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_profiles/1
  # PATCH/PUT /game_profiles/1.json
  def update
    respond_to do |format|
      if @game_profile.update(game_profile_params)
        format.html { redirect_to @game_profile, notice: 'Game profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_profile }
      else
        format.html { render :edit }
        format.json { render json: @game_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_profiles/1
  # DELETE /game_profiles/1.json
  def destroy
    @game_profile.destroy
    respond_to do |format|
      format.html { redirect_to game_profiles_url, notice: 'Game profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_profile
      @game_profile = GameProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_game_profile_params
      if params[:game_profile][:comment].blank? then
        params[:game_profile][:comment] = ""
      end
      if params[:game_profile][:image_path01].blank? then
        params[:game_profile][:image_path01] = ""
      end
      if params[:game_profile][:image_path02].blank? then
        params[:game_profile][:image_path02] = ""
      end
      if params[:game_profile][:image_path03].blank? then
        params[:game_profile][:image_path03] = ""
      end
      if params[:game_profile][:image_path04].blank? then
        params[:game_profile][:image_path04] = ""
      end
      
      if params[:game_profile][:value01].blank? then
        params[:game_profile][:value01] = ""
      end
      if params[:game_profile][:value02].blank? then
        params[:game_profile][:value02] = ""
      end
      if params[:game_profile][:value03].blank? then
        params[:game_profile][:value03] = ""
      end
      if params[:game_profile][:value04].blank? then
        params[:game_profile][:value04] = ""
      end
      if params[:game_profile][:value05].blank? then
        params[:game_profile][:value05] = ""
      end
      if params[:game_profile][:value06].blank? then
        params[:game_profile][:value06] = ""
      end
      if params[:game_profile][:value07].blank? then
        params[:game_profile][:value07] = ""
      end
      if params[:game_profile][:value08].blank? then
        params[:game_profile][:value08] = ""
      end
      if params[:game_profile][:value09].blank? then
        params[:game_profile][:value09] = ""
      end
      if params[:game_profile][:value10].blank? then
        params[:game_profile][:value10] = ""
      end

      params.require(:game_profile).permit(:user_id, :game_id, :comment, :image_path01, :image_path02, :image_path03, :image_path04, :value01, :value02, :value03, :value04, :value05, :value06, :value07, :value08, :value09, :value10, :play_start_date, :login_start_time, :login_finish_time, :delete_flag, :created_at, :updated_at)
    end
end
