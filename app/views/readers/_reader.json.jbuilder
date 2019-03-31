json.extract! reader, :id, :firstname, :lastname, :email, :created_at, :updated_at
json.url reader_url(reader, format: :json)
