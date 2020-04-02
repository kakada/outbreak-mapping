# frozen_string_literal: true

require "rails_helper"

RSpec.describe "FaqAdmins", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user)
  end

  describe "GET /index" do
    it "returns http success" do
      get faq_admins_path
      expect(response).to have_http_status(:success)
    end
  end
end
