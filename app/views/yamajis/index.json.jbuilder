json.array!(@yamajis) do |yamaji|
  json.extract! yamaji, :id, :name, :mail, :updated_at
  json.url yamaji_url(yamaji, format: :json)
end
