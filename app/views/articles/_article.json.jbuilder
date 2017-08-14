json.extract! article, :id, :title, :description, :visit_count, :created_at, :updated_at
json.url article_url(article, format: :json)
