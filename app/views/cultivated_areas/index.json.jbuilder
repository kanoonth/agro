json.array!(@cultivated_areas) do |cultivated_area|
  json.extract! cultivated_area, :id, :name, :latitude, :longitude, :plantation_date
  json.plantation_name cultivated_area.plantation.name
  json.url cultivated_area_url(cultivated_area, format: :json)
end
