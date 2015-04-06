json.extract! @cultivated_area, :id, :name, :latitude, :longitude, :plantation_date, :created_at, :updated_at
json.plantation_name @cultivated_area.plantation.name
