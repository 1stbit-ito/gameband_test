class Entry < ActiveRecord::Base
  self.primary_key = :entry_id
  belongs_to :entry_favorite, :class_name => "Favorite", :foreign_key => [:user_id, :game_id, :entry_id], :primary_key => [ :user_id, :game_id, :entry_id]
end
