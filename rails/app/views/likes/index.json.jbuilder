json.array!(@likes) do |like|
  json.extract! like, :id, :audio_id, :user_id, :data
  json.url like_url(like, format: :json)
end
