class Follow < ActiveRecord::Base
  self.primary_keys = :user_id, :game_id, :follow_user_id
end
