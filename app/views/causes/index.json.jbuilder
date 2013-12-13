json.array!(@causes) do |cause|
  json.extract! cause, :id
  json.url cause_url(cause, format: :json)
end
