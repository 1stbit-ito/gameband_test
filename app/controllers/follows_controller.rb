class FollowsController < ApplicationController

  protect_from_forgery :except => ["create", "delete"]
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
 end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
    @users = User.all
    @games = Game.all
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    entry_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    
    follows = Follow.where("user_id = ? and game_id = ? and follow_user_id = ?", params[:follow][:user_id], params[:follow][:game_id], params[:follow][:follow_user_id])
    
    if follows[0].blank? then
      @follow = Follow.new(create_follow_params)
      @follow.created_at = entry_time
      @follow.updated_at = entry_time
      
      @follower = Follower.new
      @follower.user_id = @follow.follow_user_id
      @follower.game_id = @follow.game_id
      @follower.follower_user_id = @follow.user_id
      @follower.created_at = entry_time
      @follower.updated_at = entry_time

    else
      @follow = follows[0]
      @follow.updated_at = entry_time
      @follow.delete_flag = false

      followers = Follower.where("user_id = ? and game_id = ? and follower_user_id = ?", params[:follow][:follow_user_id], params[:follow][:game_id], params[:follow][:user_id])
      @follower = followers[0]
      @follower.updated_at = entry_time
      @follower.delete_flag = false

    end

    respond_to do |format|
      if @follow.save
        @follower.save
        
        follow_user = User.find(@follow.follow_user_id)
        @ret = {
          :ret => 1,
          :user => follow_user
        }

        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        #format.json { render :show, status: :created, location: @follow }
        format.json { render :show, location: @ret }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    current_datetime = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    
    follows = Follow.where("user_id = ? and game_id = ? and follow_user_id = ?", params[:follow][:user_id], params[:follow][:game_id], params[:follow][:follow_user_id])
    if !follows[0].blank? then
      @follow = follows[0]
      @follow.updated_at = current_datetime
      @follow.delete_flag = true
      @follow.save

      followers = Follower.where("user_id = ? and game_id = ? and follower_user_id = ?", params[:follow][:follow_user_id], params[:follow][:game_id], params[:follow][:user_id])
      @follower = followers[0]
      @follower.updated_at = current_datetime
      @follower.delete_flag = false
      @follower.save

    end
    logger.debug @follow.inspect
    follow_user = User.find(params[:follow][:follow_user_id])
    @ret = {
      :ret => 1,
      :user => follow_user
    }
    render :deleted, location: @ret

  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_follow_params
      params.require(:follow).permit(:user_id, :game_id, :follow_user_id, :delete_flag, :created_at, :updated_at)
    end
    
    def create_follower_params
      params.require(:follow).permit(:user_id, :game_id, :follow_user_id, :delete_flag, :created_at, :updated_at)
    end
end
