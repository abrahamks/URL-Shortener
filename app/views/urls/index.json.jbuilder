json.array!(@urls) do |url|
  json.extract! url, :id, :long_url, :short_url, :user_id
  json.url url_url(url, format: :json)
end
