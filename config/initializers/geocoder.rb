Geocoder.configure(
  ip_lookup: :geoip2,
  geoip2: {
    file: Rails.root.join("lib", "samples", "geo", "maxmind", "GeoLite2-City.mmdb")
  }
)
