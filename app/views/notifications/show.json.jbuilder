json.extract! @notification, :id, :disease_id, :cf, :created_at, :updated_at, :body
json.contents do 
  json.array!(@contents) do |content|
    json.extract! content, :id, :created_at, :title, :body
  end
end
