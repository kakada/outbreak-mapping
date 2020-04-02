# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeHelper, type: :helper do
  describe "#youtube_thumbnail" do
    it "return youtube thumbnail url" do
      url = "https://www.youtube.com/watch?v=tZojzeE0Zlg"
      thumbnail_url = "https://img.youtube.com/vi/tZojzeE0Zlg/mqdefault.jpg"

      expect(youtube_thumbnail(url)).to eq(thumbnail_url)
    end
  end
end
