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

end
