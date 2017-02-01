require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "should have the content 'Sample App'" do
      get '/static_pages/home'
      #expect(response).to have_http_status(200)
       expect(response.body).to match "Sample App"
    end

    it "should have the base title" do
      get '/static_pages/home'
      expect(response.body).to include("<title>#{base_title}")
    end

    it "should not have a custom page title" do
      get '/static_pages/home'
      expect(response.body).not_to include('| Home')
    end


 
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      get '/static_pages/help'
      expect(response.body).to match "Help"
    end

    it "should have the title 'Help'" do
      get '/static_pages/help'
      expect(response.body).to include("<title>#{base_title} | Help</title>")
    end
 
  end

 describe "About page" do
    it "should have the content 'About us'" do
      get '/static_pages/about'
      expect(response.body).to match "About Us"
    end

    it "should have the title 'About Us'" do
      get '/static_pages/about'
      expect(response.body).to include("<title>#{base_title} | About Us</title>")
    end

  end 


 describe "Contact page" do
    it "should have the content 'Contact'" do
      get '/static_pages/contact'
      expect(response.body).to match "Contact"
    end

    it "should have the title 'Contact'" do
      get '/static_pages/contact'
      expect(response.body).to include("<title>#{base_title} | Contact</title>")
    end

  end 



end
