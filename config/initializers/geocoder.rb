Geocoder.configure do |config|

  # geocoding service (see below for supported options):
  config.lookup = :mapquest

  # set default units to kilometers:
  config.units = :km

  # caching (see below for details):
  #config.cache = Redis.new

end
