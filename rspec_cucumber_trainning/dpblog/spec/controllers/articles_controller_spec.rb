require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
	describe 'GET #index' do
    it "populates an array of article" do
    	user = FactoryGirl.create(:user)

      smith = FactoryGirl.create(:article, user: user, title: 'Smith John')
      jones = FactoryGirl.create(:article, user: user, title: 'Jones John')
      get :index
      expect(assigns(:articles)).to match_array([smith, jones])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "get infomation for 1 article" do
      user = FactoryGirl.create(:user)

      article = FactoryGirl.create(:article, user: user)
      get :show, id: article
      expect(assigns(:article)).to eq article
    end

    it "renders the :show template" do
      user = FactoryGirl.create(:user)

      article = FactoryGirl.create(:article, user: user)

      get :show, id: article
      expect(response).to render_template :show 
    end
  end

  describe 'GET #new' do
    it "assigns a new article" do
      user = FactoryGirl.create(:user)

      get :new, user_id: user
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "renders the :new template" do
      user = FactoryGirl.create(:user)

      get :new, user_id: user
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns a edit article" do
      user = FactoryGirl.create(:user)
      article = FactoryGirl.create(:article, user: user)

      get :edit, user_id: user, id: article
      expect(assigns(:article)).to eq article
    end

    it "renders the :new template" do
      user = FactoryGirl.create(:user)
      article = FactoryGirl.create(:article, user: user)

      get :edit, user_id: user, id: article
      expect(response).to render_template :edit
    end
  end
end
