json.array!(@users) do |user|
  json.extract! user, :user_id, :login_id, :password, :client_id, :nickname, :icon_image_path, :header_image_path, :delete_flag, :created_at, :updated_at
  #json.url user_url(user, format: :json)
end
