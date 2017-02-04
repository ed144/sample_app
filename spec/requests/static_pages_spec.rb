require 'rails_helper'
#require 'spec_helper'

RSpec.describe "StaticPages", type: :request do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }


  describe "Home page" do


  before {get root_path }  

    it "should have the content 'Sample App'" do
       #expect(response).to have_http_status(200)
       expect(response.body).to match "Sample App"
    end

    it "should have the base title" do
        expect(response.body).to include("<title>#{base_title}")
    end

    it "should not have a custom page title" do
           expect(response.body).not_to include('| Home')
    end


 
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      get help_path
      expect(response.body).to match "Help"
    end

    it "should have the title 'Help'" do
      get help_path
      expect(response.body).to include("<title>#{base_title} | Help</title>")
    end
 
  end

 describe "About page" do
    it "should have the content 'About us'" do
      get about_path
      expect(response.body).to match "About Us"
    end

    it "should have the title 'About Us'" do
      get about_path
      expect(response.body).to include("<title>#{base_title} | About Us</title>")
    end

  end 


 describe "Contact page" do
    it "should have the content 'Contact'" do
      get contact_path
      expect(response.body).to match "Contact"
    end

    it "should have the title 'Contact'" do
      get contact_path
      expect(response.body).to include("<title>#{base_title} | Contact</title>")
    end

  end 



end
