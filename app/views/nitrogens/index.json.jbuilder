json.array!(@nitrogens) do |nitrogen|
  json.extract! nitrogen, :id, :min, :max, :stage_id, :disease_id, :cf
  json.url nitrogen_url(nitrogen, format: :json)
end
