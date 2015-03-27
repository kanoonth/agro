json.array!(@cultivated_areas) do |cultivated_area|
  json.extract! cultivated_area, :id, :name, :latitude, :longitude, :plantation_id, :plantation_date
  json.url cultivated_area_url(cultivated_area, format: :json)
end
