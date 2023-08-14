json.extract! detail, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url detail_url(detail, format: :json)
