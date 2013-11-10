json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :name, :lastname, :partysize
  json.url rsvp_url(rsvp, format: :json)
end
