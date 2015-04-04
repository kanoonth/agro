json.array!(@contents) do |content|
  json.extract! content, :id, :title, :body, :content_images_id, :content_type_id
  json.url content_url(content, format: :json)
  json.image content.content_images.first.image.url
  json.thumb content.content_images.first.image.url(:thumb)
end
