require 'rails_helper'

RSpec.describe "ChatRooms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/chat_rooms/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/chat_rooms/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/chat_rooms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/chat_rooms/create"
      expect(response).to have_http_status(:success)
    end
  end

end
