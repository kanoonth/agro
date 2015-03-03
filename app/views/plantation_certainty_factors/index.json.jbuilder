json.array!(@plantation_certainty_factors) do |plantation_certainty_factor|
  json.extract! plantation_certainty_factor, :id, :disease_id, :plantation_id, :cf
  json.url plantation_certainty_factor_url(plantation_certainty_factor, format: :json)
end
