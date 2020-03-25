class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false
Ahoy.visit_duration = ENV.fetch('VISIT_DURATION') { '2' }.to_i.minutes
