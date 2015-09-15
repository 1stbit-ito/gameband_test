class Follower < ActiveRecord::Base
  self.primary_keys = :user_id, :game_id, :follower_user_id
end
