# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DeveloperGuides", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get developer_guides_path
      expect(response).to have_http_status(:success)
    end
  end
end
