#json.array!(@game_profiles) do |game_profile|
#  json.extract! game_profile, :user_id, :game_id, :comment, :image_path01, :image_path02, :image_path03, :image_path04, :value01, :value02, :value03, :value04, :value05, :value06, :value07, :value08, :value09, :value10, :delete_flag, :created_at, :updated_at
  #json.url game_profile_url(game_profile, format: :json)
#end

json.extract! @ret, :ret, :game_profiles
json.game_profiles @ret[:game_profiles], :user_id, :game_id, :game, :comment, :image_path01, :image_path02, :image_path03, :image_path04, :value01, :value02, :value03, :value04, :value05, :value06, :value07, :value08, :value09, :value10, :delete_flag, :created_at, :updated_at
