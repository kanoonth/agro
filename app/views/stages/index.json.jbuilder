json.array!(@stages) do |stage|
  json.extract! stage, :id, :name, :min_day, :max_day
  json.url stage_url(stage, format: :json)
end
