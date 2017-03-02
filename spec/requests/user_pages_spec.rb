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

      describe "after saving the user" do
        #before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

       
        #it { should have_link('Sign out') }
        #it { should have_title(user.name) }
        #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end


    end
  end



  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    #before { visit edit_user_path(user) }


    before do
      #sign_in user
      get edit_user_path(user)
    end


    describe "page" do
      #it { should have_content("Update your profile") }
      it "should have the content 'Update your profile'" do
        #expect(response.body).to match "Update your profile"
      end

      #it { should have_title("Edit user") }
      it "should have the title 'Edit user'" do
        #expect(response.body).to include("<title>#{base_title} | Edit user</title>")
      end


      #it { should have_link('change', href: 'http://gravatar.com/emails') }
      it "should have Gravatar link" do
        #expect(response.body).to match "http://gravatar.com/emails"
      end


    end

    describe "with invalid information" do
      #before { click_button "Save changes" }
      #it { should have_content('error') }
    end




   describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        #fill_in "Name",             with: new_name
        #fill_in "Email",            with: new_email
        #fill_in "Password",         with: user.password
        #fill_in "Confirm Password", with: user.password
        #click_button "Save changes"
      end

      #it { should have_title(new_name) }
      #it { should have_selector('div.alert.alert-success') }
      #it { should have_link('Sign out', href: signout_path) }
      #specify { expect(user.reload.name).to  eq new_name }
      #specify { expect(user.reload.email).to eq new_email }
    end


  end




  #subject { page }

  describe "index" do

  



    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      #sign_in user
      #visit users_path
      remember_token = User.new_remember_token
      cookies[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.encrypt(remember_token))
      get users_path

    end

    #it { should have_title('All users') }
    #it { should have_content('All users') }
    it "should have the content 'All users'" do
      expect(response.body).to match "All users"
    end


    describe "pagination" do
      # откомментировать для тестов pagination
      #before(:all) { 30.times { FactoryGirl.create(:user) } }
      #after(:all)  { User.delete_all }

      #it { should have_selector('div.pagination') }
      it "should have the content '<div class=\"pagination\">'" do
          # откомментировать для тестов pagination
          #expect(response.body).to match '<div class=\"pagination\">'
      end	

      it "should list each user" do
        User.paginate(page: 1).each do |user|
          #expect(page).to have_selector('li', text: user.name)
          # откомментировать для тестов pagination
           #expect(response.body).to include("#{user.name}") 

        end
      end
    end




    describe "delete links" do

      #it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          #sign_in admin
	  remember_token = User.new_remember_token
          cookies[:remember_token] = remember_token
          user.update_attribute(:remember_token, User.encrypt(remember_token))
          user.update_attribute(:admin, true)
          #visit users_path
	  get users_path
        end

        #it { should have_link('delete', href: user_path(User.first)) }
        it "should have link 'delete'" do
            expect(response.body).to include('data-method="delete"')
        end


        it "should be able to delete another user" do
          expect do
            #click_link('delete', match: :first)
	    delete user_path(user)
          end.to change(User, :count).by(-1)
        end
        #it { should_not have_link('delete', href: user_path(admin)) }
        it "should not have link 'delete' for admin" do
            expect(response.body).not_to include("#{user_path(admin)}")
        end


      end
    end








  end




end
