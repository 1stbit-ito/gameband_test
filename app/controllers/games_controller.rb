class GamesController < ApplicationController

  protect_from_forgery :except => ["create"]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index

    page = params[:page].to_i
    limit_num = params[:count].to_i
    offset_num = (page - 1) * limit_num
    
    @games = Game.limit(limit_num).offset(offset_num)
    
    respond_to do |format|
      if !@games.blank? then
        @ret = {
          :ret    => 1,
          :count  => limit_num,
          :total  => Game.count,
          :page   => page,
          :games  => @games
        }
        format.json { render :index, location: @ret }
      else
        @ret = {
          :ret      => 1,
          :messages => [
            "Not Found Games."
          ]
        }
        format.json { render json: @ret }
      end
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create

    @tag = Tag.new(create_tag_params)
    @tag.save
    @game = Game.new(create_game_params(@tag.tag_id))

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:game_id, :name, :description, :tag_id, :tag_name, :icon_image_path, :header_image_path, :web_view_url, :profile_key_name01, :profile_key_name02, :profile_key_name03, :profile_key_name04, :profile_key_name05, :profile_key_name06, :profile_key_name07, :profile_key_name08, :profile_key_name09, :profile_key_name10, :created_at, :updated_at)
    end
 
    def create_tag_params
      tag = {
        "tag_name" => params[:game][:tag_name],
        "created_at" => params[:game][:created_at],
        "updated_at" => params[:game][:updated_at],
      }
      
      params[:tag] = tag
      params.require(:tag).permit(:tag_id, :tag_name, :delete_flag, :created_at, :updated_at)
    end

    def create_game_params(tag_id)
      
      create_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")

      params[:game][:icon_image_path] = "/images/no_icon.jpg"
      params[:game][:header_image_path] = "/images/no_header.jpg"
      params[:game][:web_view_url] = ""
      
      if params[:game][:profile_key_name01].blank? then
        params[:game][:profile_key_name01] = ""
      end
      if params[:game][:profile_key_name02].blank? then
        params[:game][:profile_key_name02] = ""
      end
      if params[:game][:profile_key_name03].blank? then
        params[:game][:profile_key_name03] = ""
      end
      if params[:game][:profile_key_name04].blank? then
        params[:game][:profile_key_name04] = ""
      end
      if params[:game][:profile_key_name05].blank? then
        params[:game][:profile_key_name05] = ""
      end
      if params[:game][:profile_key_name06].blank? then
        params[:game][:profile_key_name06] = ""
      end
      if params[:game][:profile_key_name07].blank? then
        params[:game][:profile_key_name07] = ""
      end
      if params[:game][:profile_key_name08].blank? then
        params[:game][:profile_key_name08] = ""
      end
      if params[:game][:profile_key_name09].blank? then
        params[:game][:profile_key_name09] = ""
      end
      if params[:game][:profile_key_name10].blank? then
        params[:game][:profile_key_name10] = ""
      end

      params[:game][:tag_id] = tag_id

      params[:game][:created_at] = create_time
      params[:game][:updated_at] = create_time

      params.require(:game).permit(:game_id, :name, :description, :tag_id, :tag_name, :icon_image_path, :header_image_path, :web_view_url, :profile_key_name01, :profile_key_name02, :profile_key_name03, :profile_key_name04, :profile_key_name05, :profile_key_name06, :profile_key_name07, :profile_key_name08, :profile_key_name09, :profile_key_name10, :created_at, :updated_at)
    end
end
