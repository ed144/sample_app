require 'rails_helper'
require 'spec_helper'

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




    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        #sign_in user
        #visit root_path
	get root_path
	
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          #expect(page).to have_selector("li##{item.id}", text: item.content)
	  # expect(response.body).to have_selector("li##{item.id}", text: item.content)
       end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          #visit root_path
	  get root_path
        end

        #it { should have_link("0 following", href: following_user_path(user)) }
	#it { expect(response.body).to include('following') }
        #it { should have_link("1 followers", href: followers_user_path(user)) }
	#it { expect(response.body).to include('followers') }
     end


    end



 

  end





  describe "Help page" do

  before {get help_path }  

    it "should have the content 'Help'" do
      expect(response.body).to match "Help"
    end

    it "should have the title 'Help'" do
      expect(response.body).to include("<title>#{base_title} | Help</title>")
    end
 
  end

 describe "About page" do

   before {get about_path }  


    it "should have the content 'About us'" do
      expect(response.body).to match "About Us"
    end

    it "should have the title 'About Us'" do
       expect(response.body).to include("<title>#{base_title} | About Us</title>")
    end

  end 


 describe "Contact page" do
   before {get contact_path }  

    it "should have the content 'Contact'" do
      expect(response.body).to match "Contact"
    end

    it "should have the title 'Contact'" do
      expect(response.body).to include("<title>#{base_title} | Contact</title>")
    end

  end 



end
