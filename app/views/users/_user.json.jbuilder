json.extract! user, :id, :name, :mail_address, :created_at, :updated_at
json.url user_url(user, format: :json)
