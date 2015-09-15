json.array!(@follows) do |follow|
  json.extract! follow, :id, :user_id, :game_id, :follow_user_id, :delete_flag, :created_at, :updated_at
  json.url follow_url(follow, format: :json)
end
