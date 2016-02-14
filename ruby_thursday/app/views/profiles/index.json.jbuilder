json.array!(@profiles) do |profile|
  json.extract! profile, :id, :bio, :member_id
  json.url profile_url(profile, format: :json)
end
