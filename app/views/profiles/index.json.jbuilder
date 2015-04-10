json.array!(@profiles) do |profile|
  json.extract! profile, :id, :full_name, :phone_number, :email, :position, :years_of_experiance, :cover_letter, :resume, :reference
  json.url profile_url(profile, format: :json)
end
