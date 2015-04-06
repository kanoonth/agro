json.array!(@contents) do |content|
  json.extract! content, :id, :title, :body, :content_type_id
  json.url content_url(content, format: :json)
  json.image request.base_url + content.content_images.first.image.url unless content.content_images.empty?
  json.thumb request.base_url + content.content_images.first.image.url(:thumb) unless content.content_images.empty?
end
