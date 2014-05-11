json.array!(@reacts) do |react|
  json.extract! react, :id, :name
  json.url react_url(react, format: :json)
end
