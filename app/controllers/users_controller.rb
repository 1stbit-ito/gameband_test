require "securerandom"

class UsersController < ApplicationController

  protect_from_forgery :except => ["create", "login"]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

 
  # POST /users/login.json
  def login 
    @users = User.where("login_id = ? and password = ?", params[:login_id], params[:password]).limit(1)
    
    respond_to do |format|
      if !@users.blank? then
        @ret = {
          :ret  => 1,
          :user => @users[0]
        }
        format.json { render :login, location: @ret }
      else
        @ret = {
          :ret  => 0,
          :messages => [
            "User Not Found."
          ]
        }
        format.json { render json: @ret }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
   
    @user = User.new(create_user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
        @ret = {
          :ret  => 1,
          :user => @user
        }
        format.json { render :created, status: :created, location: @ret }
      else
        format.html { render :new }
        
        logger.debug "------------------------------------"
        logger.debug @user.errors.inspect
        logger.debug "------------------------------------"
        
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        @ret = {
          :ret => 0,
          :messages => @user.errors.full_messages
        }
        format.json { render json: @ret }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :login_id, :password, :client_id, :nickname, :image_path01, :image_path02, :image_path03, :image_path04, :delete_flag, :created_at, :updated_at)
    end

    def create_user_params

      create_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")

      params[:user][:user_id] = SecureRandom.hex(8)
      params[:user][:client_id] = SecureRandom.hex(8)
      params[:user][:created_at] = create_time
      params[:user][:updated_at] = create_time
      params[:user][:icon_image_path] = "/images/%s_icon.jpg" % [params[:user][:user_id]]
      params[:user][:header_image_path] = "/images/%s_header.jpg" % [params[:user][:user_id]]

      params.require(:user).permit(:user_id, :login_id, :password, :client_id, :nickname, :icon_image_path, :header_image_path, :delete_flag, :created_at, :updated_at)
    end
end
