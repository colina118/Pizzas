json.array!(@branches) do |branch|
  json.extract! branch, :id, :adress, :postal_code, :phone_number
  json.url branch_url(branch, format: :json)
end
