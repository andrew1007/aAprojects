require 'spec_helper'

describe User do
  subject(:user) do
    FactoryGirl.build(:user, name: "andrew", password: "yuehyueh")
  end

  # validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(10).on(:create) }
  # associations
  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  it "creates a password digest when user is made" do
    expect(user.password_digest).to be_truthy
  end

  it "makes a session token after initialization" do
    expect(user.session_token).to be_truthy
  end

  describe "#reset_session_token!" do
    it "sets a session token" do
      current_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(current_session_token)
    end
  end

  describe "#is_password?" do
    it "checks incorrect password" do
      user.is_password?("safdasfdsasdaf").to be_falsey
    end

    it "checks correct password" do
      user.is_password?("yuehyueh").to be_truthy
    end
  end

  describe ".find_by_credentials" do
    it "finds correct person" do
      User.find_by_credentials("andrew", "yuehyueh").to be_truthy
    end

    it "returns nil if incorrect credentials" do
      User.find_by_credentials("andrew", "yuehdyueh").to be_nil
    end
  end
end
