require 'rails_helper'

RSpec.describe "Friends", type: :request do

  describe "GET /followings" do
    it "returns http success" do
      get "/friends/followings"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followers" do
    it "returns http success" do
      get "/friends/followers"
      expect(response).to have_http_status(:success)
    end
  end

end
