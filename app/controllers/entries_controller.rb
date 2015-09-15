class EntriesController < ApplicationController

  protect_from_forgery :except => ["create", "retweet", "reply"]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @games = Game.all
    @users = User.all
    @tags = Tag.all
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  # POST /entry/post
  def create
    @entry = Entry.new(create_entry_params)
    @entry.entry_id = SecureRandom.hex(8)
    @entry.relation_tag = @entry.entry_id

    @entry.entry_tags_ids = ""
    params[:entry][:entry_tags_ids].each do |entry_tag|
      @entry.entry_tags_ids = @entry.entry_tags_ids + entry_tag + " " 
    end

    @entry.reply_to = ""
    params[:entry][:entry_reply_to].each do |to|
      @entry.reply_to = @entry.reply_to + to + " " 
    end

    # タイムラインタイプをタグから判定
    timeline_type = 0;
    if !params[:timeline_type].blank? then
      timeline_type = params[:timeline_type]
    end

    @game = Game.find(@entry.game_id)
    @timeline = Timeline.new({
      :entry_id       => @entry.entry_id,
      :user_id        => @entry.entry_user_id,
      :entry_user_id  => @entry.entry_user_id,
      :entry_time     => @entry.entry_time,
      :game_id        => @entry.game_id,
      :event_id       => @entry.event_id,
      :tags           => @game.tag_name,
      :timeline_type  => timeline_type,
      :reply_to       => @entry.reply_to,
      :created_at     => @entry.created_at,
      :updated_at     => @entry.updated_at
    })
    @timeline.save

    @followers = Follower.where("user_id = ? and game_id = ?", @entry.entry_user_id, @entry.game_id)
    @followers.each do |follower|
      logger.debug "-----------------------------------"
      logger.debug follower.follower_user_id
      
      timeline = Timeline.new({
        :entry_id       => @entry.entry_id,
        :user_id        => follower.follower_user_id,
        :entry_user_id  => @entry.entry_user_id,
        :entry_time     => @entry.entry_time,
        :game_id        => @entry.game_id,
        :event_id       => @entry.event_id,
        :tags           => @game.tag_name,
        :timeline_type  => timeline_type,
        :reply_to       => @entry.reply_to,
        :created_at     => @entry.created_at,
        :updated_at     => @entry.updated_at
      })

      timeline.save
    end

    @timeline.save

    respond_to do |format|
      if @entry.save
        @ret = {
          :ret => 1,
          :entry => @entry
        }
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :created, location: @ret }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /entry/retweet
  def retweet
    
    @parent_entry = Entry.find(params[:entry][:parent_id])
    @entry = @parent_entry.dup
    
    # retweet記事の追加
    @entry.entry_id = SecureRandom.hex(8)
    @entry.entry_user_id = params[:entry][:user_id]
    @entry.parent_id = @parent_entry.entry_id
    @entry.content = params[:entry][:content]
    retweet_flag = false;
    if @entry.content != ""
      # 引用リツイート
      @entry.entry_type = 0
      @entry.reply_to = "";
      @entry.entry_tags_ids = ""
      params[:entry][:entry_tags_ids].each do |entry_tag|
        @entry.entry_tags_ids = @entry.entry_tags_ids + entry_tag + " " 
      end

      @entry.reply_to = ""
      params[:entry][:entry_reply_to].each do |to|
        @entry.reply_to = @entry.reply_to + to + " " 
      end

      retweet_flag = false
      @entry.save
    else 
      # リツイート
      @entry.entry_type = 1
      retweet_flag = true
      entries = Entry.where("entry_user_id = ? and parent_id = ? and entry_type = 1", @entry.entry_user_id, @entry.parent_id)
      if entries.count == 0 then
        @entry.save
      end
    end

    timelines = Timeline.where("entry_id = ? and user_id = ?", @parent_entry.entry_id, params[:entry][:user_id])
    if timelines.count == 0 then
      @timeline = Timeline.new({
        :entry_id       => @parent_entry.entry_id,
        :user_id        => params[:entry][:user_id],
        :entry_user_id  => @parent_entry.entry_user_id,
        :entry_time     => @entry.entry_time,
        :game_id        => @entry.game_id,
        :event_id       => @entry.event_id,
        :tags           => "",
        :timeline_type  => 0,
        :reply_to       => @entry.reply_to,
        :retweet_flag   => retweet_flag,
        :created_at     => @entry.created_at,
        :updated_at     => @entry.updated_at
      })
      @timeline.save
    else
      if retweet_flag then

        timelines[0].retweet_flag = true
        timelines[0].save
        
        # 親のretweet回数をincrement
        @parent_entry.increment(:retweet_num, 1)
        @parent_entry.save
      end
    end

    respond_to do |format|
      @ret = {
        :ret => 1,
        :entry => @entry
      }
      format.json { render :created, location: @ret }
    end

  end

  def reply
    @entry = Entry.new(create_entry_params)
    @entry.entry_id = SecureRandom.hex(8)
     
    @entry.relation_tag = @entry.entry_id
    if !@entry.parent_id.blank? then
      @parent_entry = Entry.find(params[:entry][:parent_id])
      @entry.relation_tag = @parent_entry.relation_tag + "_" + @entry.entry_id

      logger.debug "[relation_tag]" + @entry.relation_tag

    end

    @entry.entry_tags_ids = ""
    params[:entry][:entry_tags_ids].each do |entry_tag|
      @entry.entry_tags_ids = @entry.entry_tags_ids + entry_tag + " " 
    end

    @entry.reply_to = ""
    params[:entry][:entry_reply_to].each do |to|
      @entry.reply_to = @entry.reply_to + to + " " 
    end

    # タイムラインタイプをタグから判定
    timeline_type = 0;
    if !params[:timeline_type].blank? then
      timeline_type = params[:timeline_type]
    end

    @game = Game.find(@entry.game_id)
    @timeline = Timeline.new({
      :entry_id       => @entry.entry_id,
      :user_id        => @entry.entry_user_id,
      :entry_user_id  => @entry.entry_user_id,
      :entry_time     => @entry.entry_time,
      :game_id        => @entry.game_id,
      :event_id       => @entry.event_id,
      :tags           => @game.tag_name,
      :timeline_type  => timeline_type,
      :reply_to       => @entry.reply_to,
      :created_at     => @entry.created_at,
      :updated_at     => @entry.updated_at
    })

    logger.debug "-----------------------------------"
    logger.debug @entry.created_at
    logger.debug @timeline.inspect 
    logger.debug "-----------------------------------"

    @timeline.save

    respond_to do |format|
      if @entry.save
        @ret = {
          :ret => 1,
          :entry => @entry
        }
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :created, location: @ret }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:entry_id, :entry_time, :entry_user_id, entry_user_nickname, :game_id, :content, :tags, :reply_to, :entry_type, :parent_id, :relation_tag, :image_path01, :image_path02, :image_path03, :image_path04, :retweet_num, :favorite_num, :warning_num, :delete_flag, :created_at, :updated_at)
    end

    def create_entry_params 

      entry_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")

      params[:entry][:entry_user_nickname] = ""
      params[:entry][:entry_time] = entry_time

      if params[:entry][:entry_tags_ids].blank? then
        params[:entry][:entry_tags_ids] = Array.new
      end
      
      if params[:entry][:entry_reply_to].blank? then
        params[:entry][:entry_reply_to] = Array.new
      end
      
      if params[:entry][:parent_id].blank? then
        params[:entry][:parent_id] = ""
      end

      if params[:entry][:image_path01].blank? then
        params[:entry][:image_path01] = ""
      end
      if params[:entry][:image_path02].blank? then
        params[:entry][:image_path02] = ""
      end
      if params[:entry][:image_path03].blank? then
        params[:entry][:image_path03] = ""
      end
      if params[:entry][:image_path04].blank? then
        params[:entry][:image_path04] = ""
      end
      
      params[:entry][:created_at] = entry_time
      params[:entry][:updated_at] = entry_time

      params.require(:entry).permit(:entry_id, :entry_time, :entry_user_id, :entry_user_nickname, :game_id, :content, :entry_tags_ids, :reply_to, :entry_type, :parent_id, :relation_tag, :image_path01, :image_path02, :image_path03, :image_path04, :retweet_num, :favorite_num, :warning_num, :delete_flag, :created_at, :updated_at)

    end
    
    def retweet_entry_params
      entry_time = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
      
      if params[:entry][:content].blank? then
        params[:entry][:content] = ""
      end
      
      if params[:entry][:entry_tags_ids].blank? then
        params[:entry][:entry_tags_ids] = Array.new
      end
      
      if params[:entry][:entry_reply_to].blank? then
        params[:entry][:entry_reply_to] = Array.new
      end
      
      params[:entry][:created_at] = entry_time
      params[:entry][:updated_at] = entry_time

      params.require(:entry).permit(:entry_id, :entry_time, :entry_user_id, :entry_user_nickname, :game_id, :content, :entry_tags_ids, :reply_to, :entry_type, :parent_id, :relation_tag, :image_path01, :image_path02, :image_path03, :image_path04, :retweet_num, :favorite_num, :warning_num, :delete_flag, :created_at, :updated_at)
      
    end

end
