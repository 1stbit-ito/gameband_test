class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  # GET /timelines
  # GET /timelines.json
  def index

    page = params[:page].to_i
    limit_num = params[:count].to_i
    offset_num = (page - 1) * limit_num

    if params[:timeline_type].blank? || params[:timeline_type] == '0' then
      @timelines = Timeline.where("user_id = ? and game_id = ?", params[:user_id], params[:game_id]).limit(limit_num).offset(offset_num)
    else
      @timelines = Timeline.where("user_id = ? and game_id = ? and timeline_type = ?", params[:user_id], params[:game_id], params[:timeline_type]).limit(limit_num).offset(offset_num)
    end
    
    @all_timelines = Timeline.where("user_id = ? and game_id = ?", params[:user_id], params[:game_id])
    respond_to do |format|
      if !@timelines.blank? then
        @ret = {
          :ret    => 1,
          :count  => limit_num,
          :total  => @all_timelines.count,
          :page   => page,
          :entries  => @timelines
        }
        format.json { render :index, location: @ret }
      else
        @ret = {
          :ret      => 1,
          :messages => [
            "Not Found Entries."
          ]
        }
        format.json { render json: @ret }
      end
    end


  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
  end

  # GET /timelines/1/edit
  def edit
  end

  # POST /timelines
  # POST /timelines.json
  def create
    @timeline = Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to @timeline, notice: 'Timeline was successfully created.' }
        format.json { render :show, status: :created, location: @timeline }
      else
        format.html { render :new }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to @timeline, notice: 'Timeline was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeline }
      else
        format.html { render :edit }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.json
  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url, notice: 'Timeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeline_params
      params.require(:timeline).permit(:user_id, :game_id, :entry_id, :entry_time, :entry_user_id, :tags, :reply_to, :text, :retweet_flag, :favorite_flag, :warning_flag, :delete_flag, :created_at, :updated_at)
    end
end
