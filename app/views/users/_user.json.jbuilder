json.extract! user, :id, :username, :email, :first_name, :last_name, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)