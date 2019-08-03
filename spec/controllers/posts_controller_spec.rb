require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
	
	 describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
	describe "before_filters" do
		it { should use_before_action(:logged_in) }
	end
end
