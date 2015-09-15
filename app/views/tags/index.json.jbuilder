#json.array!(@tags) do |tag|
#  json.extract! tag, :id, :tag_id, :tag_name, :game_id, :event_id, :delete_flag, :created_at, :updated_at
#  json.url tag_url(tag, format: :json)
#end

json.extract! @ret, :ret, :tags
