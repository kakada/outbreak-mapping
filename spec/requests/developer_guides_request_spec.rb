require 'rails_helper'

RSpec.describe "DeveloperGuides", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/developer_guides/index"
      expect(response).to have_http_status(:success)
    end
  end

end
