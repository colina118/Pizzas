json.array!(@managers) do |manager|
  json.extract! manager, :id, :employee_id, :shift
  json.url manager_url(manager, format: :json)
end
