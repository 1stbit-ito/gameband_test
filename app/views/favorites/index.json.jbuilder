json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :user_id, :game_id, :entry_id, :delete_flag, :created_at, :updated_at
  json.url favorite_url(favorite, format: :json)
end
