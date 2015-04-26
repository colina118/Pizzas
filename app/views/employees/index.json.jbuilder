json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :lastname, :user, :branch_id, :password_digest
  json.url employee_url(employee, format: :json)
end
