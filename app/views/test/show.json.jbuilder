json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :login_id, :password, :client_id, :nickname, :image_path01, :image_path02, :image_path03, :image_path04, :delete_flag, :created_at, :updated_at
  json.url user_url(user, format: :json)
end
