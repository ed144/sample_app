require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "signup page" do

    before { get signup_path }

    it "should have the content 'Sign up'" do
      expect(response.body).to match "Sign up"
    end

    it "should have the title 'Sign up'" do
        expect(response.body).to include("<title>#{base_title} | Sign up</title>")
    end

  end


  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }

  	before {get user_path(user) }

    it "should have the content 'user.name'" do
      expect(response.body).to match "#{user.name}"
    end

    it "should have the title 'user.name'" do
        expect(response.body).to include("<title>#{base_title} | #{user.name}</title>")
    end

  end



  describe "signup page" do

    before { get signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        #expect { click_button submit }.not_to change(User, :count)

      end
    end

    describe "with valid information" do
      before do
        #fill_in "Name",         with: "Example User"
        #fill_in "Email",        with: "user@example.com"
        #fill_in "Password",     with: "foobar"
        #fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        #expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end




end
