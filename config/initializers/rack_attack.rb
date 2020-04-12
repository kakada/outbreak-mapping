class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.safelist('allow from localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  Rack::Attack.throttle('req/ip', limit: ENV['THROTTLE_PER_SECOND'].to_i, period: ENV['THROTTLE_IN_SECOND'].to_i.second) do |req|
    req.ip
  end

  Rack::Attack.throttled_response = lambda do |env|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 429 for throttling by default
    [ 503, {}, ['Internal Server Error']]
  end
end
