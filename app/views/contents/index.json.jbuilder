json.array!(@contents) do |content|
  json.extract! content, :id, :title, :body, :content_images_id, :content_type_id
  json.url content_url(content, format: :json)
end
