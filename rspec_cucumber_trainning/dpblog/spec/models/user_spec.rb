require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a firstname" do
    user = FactoryGirl.build(:user, firstname: nil)
    user.valid?
    expect(user.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    user = FactoryGirl.build(:user, lastname: nil)
    user.valid?
    expect(user.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "returns a contact's full name as a string" do
    user = FactoryGirl.build(:user,
      firstname: 'Phan',
      lastname: 'Duy'
    )
    expect(user.name).to eq 'Phan Duy'
  end
end
