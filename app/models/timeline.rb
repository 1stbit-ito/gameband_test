class Timeline < ActiveRecord::Base
  self.primary_keys = :entry_id, :user_id
  default_scope -> { order(:entry_time => :desc) }
  belongs_to :entry_user, :class_name => "User", :foreign_key => "entry_user_id"
  belongs_to :entry_user_follow, :class_name => "Follow", :foreign_key => [:user_id, :game_id, :entry_user_id], :primary_key => [ :user_id, :game_id, :follow_user_id ]
  belongs_to :entry_favorite, :class_name => "Favorite", :foreign_key => [:user_id, :game_id, :entry_id], :primary_key => [ :user_id, :game_id, :entry_id ]
  belongs_to :entry, :class_name => "Entry", :foreign_key => "entry_id"
end
