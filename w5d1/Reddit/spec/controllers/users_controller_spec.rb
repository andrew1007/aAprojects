require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post: :create, :use {name: "andrew", password: "yuehadf"}
        expect(response).to render_template('new')
      end

      it "validates that the password is at least 6 characters long" do
        post: :create, :use {name: "andrew", password: "yue"}
        expect(response.to render_template('new'))
      end
    end

    context "with valid params" do
      it "redirects user to links index on success"
      post: :create, :use {name: "andrew", password: "yueh"}
      expect(response).to redirect_to(subs_url)
    end
  end
end
