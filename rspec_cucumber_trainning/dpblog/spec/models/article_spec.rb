require 'rails_helper'

RSpec.describe Article, :type => :model do
  
  it "is has a valid factory" do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  it "is invalid without a title" do
    article = FactoryGirl.build(:article, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end
  
  it "returns a article's title as a string" do 
  	article = FactoryGirl.build(:article, title: "John Doe", text: "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente.") 
  	expect(article.title).to eq("John Doe")
  end

  describe "filter title by letter" do
  	before :each do
  		@phan = FactoryGirl.create(:article, title: "Neque dicta enim quasi")
  		@phanduy = FactoryGirl.create(:article, title: "Naque dicta enim quasi")
  		@phanphuong = FactoryGirl.create(:article, title: "ABC")
  	end

  	context "matching letters" do
  		it "returns a sorted array of results that match" do 
  			expect(Article.by_letter("N")).to  eq [@phanduy, @phan]
  		end
  	end

  	context "non-matching letters" do
  	  it "does not return contacts that don't start with the provided letter" do 
        expect(Article.by_letter("N")).not_to include @phanphuong
  	 	end
  	end
  end
end
