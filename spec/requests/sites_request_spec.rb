require 'rails_helper'

RSpec.describe "Sites", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sites/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sites/create"
      expect(response).to have_http_status(:success)
    end
  end

end
