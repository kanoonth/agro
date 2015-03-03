json.array!(@region_certainty_factors) do |region_certainty_factor|
  json.extract! region_certainty_factor, :id, :region_id, :disease_id
  json.url region_certainty_factor_url(region_certainty_factor, format: :json)
end
