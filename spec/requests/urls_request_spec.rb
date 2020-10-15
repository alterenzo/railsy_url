require 'rails_helper'

RSpec.describe "Urls", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "redirects to the saved url if present in the db" do
      url = FactoryBot.create(:url)

      get "/urls/#{url.id}"
      expect(response).to redirect_to(url.original_url)
    end

    it 'redirects to urls/new if the Url does not exist in the db' do
      get "/urls/id-not-in-db"
      expect(response).to redirect_to(new_url_path)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/urls/create"
      expect(response).to have_http_status(:success)
    end
  end

end
