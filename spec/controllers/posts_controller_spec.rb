require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	
	describe "before_filters" do
		it { should use_before_action(:authenticate_user) }
	end
	
  describe "GET #new" do
    it "returns http redirect unless logged_in" do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end
	
	 describe "GET #posts" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
	
end
