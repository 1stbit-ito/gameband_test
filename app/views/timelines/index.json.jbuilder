#json.array!(@timelines) do |timeline|
#  json.extract! timeline, :user_id, :game_id, :event_id, :timeline_type, :tags, :entry_id, :entry_time, :entry, :entry_user_id, :entry_user, :reply_to, :retweet_flag, :favorite_flag, :warning_flag, :delete_flag, :created_at, :updated_at 
#  
#  #json.url timeline_url(timeline, format: :json)
#end
json.extract! @ret, :ret, :count, :total, :page, :entries
json.entries @ret[:entries], :user_id, :game_id, :event_id, :timeline_type, :tags, :entry_id, :entry_time, :entry, :entry_user_id, :entry_user, :entry_user_follow, :reply_to, :retweet_flag, :favorite_flag, :warning_flag, :delete_flag, :created_at, :updated_at
