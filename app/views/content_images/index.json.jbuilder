json.array!(@content_images) do |content_image|
  json.extract! content_image, :id, :link
  json.url content_image_url(content_image, format: :json)
end
