json.extract! search, :id, :user, :title, :description, :tag, :created_at, :updated_at
json.url search_url(search, format: :json)
