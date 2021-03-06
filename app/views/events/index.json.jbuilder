json.array!(@events) do |event|
  json.extract! event, :id, :event_id, :game_id, :name, :description, :tag_name, :event_type, :revival_event_id, :start_date, :finish_date, :delete_flag, :created_at, :updated_at
  json.url event_url(event, format: :json)
end
