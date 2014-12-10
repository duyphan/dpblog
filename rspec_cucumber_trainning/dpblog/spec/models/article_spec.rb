require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "has a valid factory" do
  	FactoryGirl.create(:article).should be_valid
  end
  it "is invalid without a title" do 
  	FactoryGirl.build(:article, title: nil).should_not be_valid
  end
  it "returns a article's title as a string" do 
  	article = FactoryGirl.create(:article, title: "John Doe", text: "Neque dicta enim quasi. Qui corrupti est quisquam. Facere animi quod aut. Qui nulla consequuntur consectetur sapiente.") 
  	expect(article.title).to eq("John Doe")
  end
end
