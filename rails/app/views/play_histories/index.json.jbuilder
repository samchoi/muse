json.array!(@play_histories) do |play_history|
  json.extract! play_history, :id, :audio_id, :user_id, :data
  json.url play_history_url(play_history, format: :json)
end
