class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
    
    if params[:event_id].blank? || params[:event_id] == 0 then
      @tags = Tag.where("game_id = ?", params[:game_id])
    elsif params[:event_id] == "all" then
      @tags = Tag.where("game_id = ? and event_id <> 0", params[:game_id])
    else
      @tags = Tag.where("game_id = ? and event_id = ?", params[:game_id], params[:event_id])
    end
    
    respond_to do |format|
    if !@tags.blank? then
      @ret = {
        :ret    => 1,
        :tags  => @tags
      }
      format.json { render :index, location: @ret }
    else
      @ret = {
        :ret      => 0,
        :messages => [
          "Not Found Tags."
        ]
      }
      format.json { render json: @ret }
      end
    end
    
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:tag_id, :tag_name, :game_id, :event_id, :delete_flag, :created_at, :updated_at)
    end
end
