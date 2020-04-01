require 'rails_helper'

RSpec.describe "FaqAdmins", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/faq_admins/index"
      expect(response).to have_http_status(:success)
    end
  end

end
