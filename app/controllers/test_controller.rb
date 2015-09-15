class TestController < ApplicationController
  def index
    @users = User.all
    logger.debug @users.inspect
  end
  def show
  end
  def new
    @user = User.new
  end
  def test
    render :text => "[TEST]#{params[:test][:test]}"
  end
end
