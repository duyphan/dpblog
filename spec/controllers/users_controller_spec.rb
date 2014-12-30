require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	describe 'user access' do
    before :each do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end

    describe 'GET #index' do
      # it "collects users into @users" do
      #   user = FactoryGirl.create(:user)
      #   get :index
      #   expect(assigns(:users)).to match_array [@user,user]
      # end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    it "GET #new denies access" do
      get :new
      expect(response).to redirect_to root_url
    end

    it "POST#create denies access" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to root_url
    end
  end
end
