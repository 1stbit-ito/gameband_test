class FavoritesController < ApplicationController
  protect_from_forgery :except => ["create"]
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
    @users = User.all
    @entries = Entry.all

  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    current_datetime = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    
    favorites = Favorite.where("user_id = ? and entry_id = ?", params[:favorite][:user_id], params[:favorite][:entry_id])
    logger.debug "[]-------------------------------------------------"
    logger.debug favorites.inspect
    logger.debug "[]-------------------------------------------------"
    if favorites[0].blank? then
      @favorite = Favorite.new(create_favorite_params)
    else
      @favorite = favorites[0]
      @favorite.updated_at = current_datetime
    end
    logger.debug @favorite.inspect
    @favorite.delete_flag = false
    
    @entry = Entry.find(params[:favorite][:entry_id])
    @favorite.game_id = @entry.game_id
    
    @entry.increment(:favorite_num, 1)
    @entry.updated_at = current_datetime
    @entry.save

    timelines =  Timeline.where("entry_id = ? and user_id = ?", @entry.entry_id, @favorite.user_id) 
    if !timelines[0].blank? then
      timelines[0].favorite_flag = true
      timelines[0].updated_at = current_datetime
      timelines[0].save
    end

    logger.debug "-------------------------------------------------"
    logger.debug @timeline.inspect
    logger.debug "-------------------------------------------------"

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        @ret = {
          :ret => 1
        }
        format.json { render :created, location: @ret }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    current_datetime = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")

    favorites = Favorite.where("user_id = ? and entry_id = ?", params[:favorite][:user_id], params[:favorite][:entry_id]) 
    if !favorites[0].blank? then
      favorites[0].delete_flag = true
      favorites[0].updated_at = current_datetime
      favorites[0].save
      
      @entry = Entry.find(params[:favorite][:entry_id])
      @entry.increment(:favorite_num, -1)
      @entry.updated_at = current_datetime
      @entry.save

      timelines =  Timeline.where("entry_id = ? and user_id = ?", @entry.entry_id, favorites[0].user_id)
      if !timelines[0].blank? then
        timelines[0].favorite_flag = false
        timelines[0].updated_at = current_datetime
        timelines[0].save
      end
    end
    @ret = {
      :ret => 1
    }
    render :deleted, location: @ret
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_favorite_params
      current_datetime = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
      params[:favorite][:created_at] = current_datetime
      params[:favorite][:updated_at] = current_datetime

      params.require(:favorite).permit(:user_id, :game_id, :entry_id, :delete_flag, :created_at, :updated_at)
    end
end
