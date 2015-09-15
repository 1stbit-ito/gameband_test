class Favorite < ActiveRecord::Base
  self.primary_keys = :user_id, :game_id, :entry_id
end
