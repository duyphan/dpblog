require 'rails_helper'

RSpec.describe Article, :type => :model do
  
  it "is has a valid factory" do
    user = FactoryGirl.create(:user)
    article = FactoryGirl.create(:article, user: user)

    expect(article).to be_valid
  end

  it "is invalid without a title" do
    user = FactoryGirl.create(:user)
    article = FactoryGirl.build(:article, user: user, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end
  
  it "returns a article's title as a string" do 
    user = FactoryGirl.create(:user)
  	article = FactoryGirl.build(:article, user: user, title: "John Doe", text: "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente.") 
  	expect(article.title).to eq("John Doe")
  end

  describe "filter title by letter" do
    user = FactoryGirl.create(:user)
  	before :each do
  		@phan = FactoryGirl.create(:article, user: user, title: "Neque dicta enim quasi")
  		@phanduy = FactoryGirl.create(:article, user: user, title: "Naque dicta enim quasi")
  		@phanphuong = FactoryGirl.create(:article, user: user, title: "ABC")
  	end

  	context "matching letters" do
  		it "returns a sorted array of results that match" do 
  			expect(Article.by_letter("N")).to eq [@phanduy, @phan]
  		end
  	end

  	context "non-matching letters" do
  	  it "does not return contacts that don't start with the provided letter" do 
        expect(Article.by_letter("N")).not_to include @phanphuong
  	 	end
  	end
  end
end
