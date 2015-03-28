json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :content_id, :user
  json.url comment_url(comment, format: :json)
end
