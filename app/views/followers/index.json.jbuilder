json.array!(@followers) do |follower|
  json.extract! follower, :id, :user_id, :game_id, :follower_user_id, :delete_flag, :created_at, :updated_at
  json.url follower_url(follower, format: :json)
end
