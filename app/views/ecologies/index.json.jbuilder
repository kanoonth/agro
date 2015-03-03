json.array!(@ecologies) do |ecology|
  json.extract! ecology, :id, :name
  json.url ecology_url(ecology, format: :json)
end
