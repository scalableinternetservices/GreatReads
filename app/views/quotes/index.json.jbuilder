json.array!(@quotes) do |quote|
  json.extract! quote, :id, :body, :book_id, :author_id
  json.url quote_url(quote, format: :json)
end
