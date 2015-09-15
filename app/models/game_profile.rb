class GameProfile < ActiveRecord::Base
  self.primary_keys = :user_id, :game_id
  belongs_to :game, :class_name => "Game", :foreign_key => "game_id"
end
