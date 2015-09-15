json.array!(@entries) do |entry|
  json.extract! entry, :id, :entry_id, :entry_time, :entry_user_id, :game_id, :content, :tags, :reply_to, :entry_type, :parent_id, :relation_tag, :image_path01, :image_path02, :image_path03, :image_path04, :retweet_num, :favorite_num, :warning_num, :delete_flag, :created_at, :updated_at
  json.url entry_url(entry, format: :json)
end
