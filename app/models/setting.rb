# frozen_string_literal: true

class Setting < ApplicationRecord
    def self.marker_radius_baseline
        ENV.fetch('MAP_MARKER_RADIUS_BASELINE') { 100 }.to_i
    end
end
