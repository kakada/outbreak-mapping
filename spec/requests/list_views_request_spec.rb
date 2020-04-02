# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ListViews", type: :request do
  describe "GET /index" do
    let!(:report) { create(:report)}
    it "returns http success" do
      get list_views_path
      expect(response).to have_http_status(:success)
    end
  end
end
