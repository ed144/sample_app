require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      get '/static_pages/home'
      #expect(response).to have_http_status(200)
       expect(response.body).to match "Sample App"
    end

    it "should have the title 'Home'" do
      get '/static_pages/home'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | Home</title>')
    end
 
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      get '/static_pages/help'
      expect(response.body).to match "Help"
    end

    it "should have the title 'Help'" do
      get '/static_pages/help'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | Help</title>')
    end
 
  end

 describe "About page" do
    it "should have the content 'About us'" do
      get '/static_pages/about'
      expect(response.body).to match "About Us"
    end

    it "should have the title 'About Us'" do
      get '/static_pages/about'
      expect(response.body).to include('<title>Ruby on Rails Tutorial Sample App | About Us</title>')
    end

  end 

end
