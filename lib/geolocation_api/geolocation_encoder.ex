# Encodes all fields in Geolocation schema as Json
alias GeolocationHandler.Geolocations.Geolocation

defimpl Jason.Encoder, for: Geolocation do
  def encode(value, opts) do
    Jason.Encode.map(Map.take(value, Geolocation.get_field_list()), opts)
  end
end
