json.array!(@stage_certainty_factors) do |stage_certainty_factor|
  json.extract! stage_certainty_factor, :id, :cf, :stage_id, :disease_id
  json.url stage_certainty_factor_url(stage_certainty_factor, format: :json)
end
