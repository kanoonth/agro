json.array!(@plantations) do |plantation|
  json.extract! plantation, :id, :name
  json.url plantation_url(plantation, format: :json)
end
