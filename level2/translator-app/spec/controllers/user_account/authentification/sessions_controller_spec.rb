# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserAccount::Authentification::SessionsController, type: :controller do
  fixtures :users

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "GET new" do
    it "renders the new template" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    describe "when user send good data" do
      before do
        post :create, params: { user: {
          email: users(:matthieu).email, password: 'password01' }
        }
      end

      it "sign in user" do
        expect(response.status).to eq(302)
      end

      it "redirect user on his dashboard" do
        expect(response).to redirect_to(user_account_dashboards_path)
      end
    end

    describe "when user send wrong data" do
      it "set a flash error message" do
        post :create, params: { user: {
          email: users(:matthieu).email, password: 'foobar' }
        }

        expect(flash[:alert]).to eq('Invalid Email or password.')
      end
    end
  end

  describe "DELETE destroy" do
    before do
      sign_in users(:matthieu), scope: :user
      delete :destroy
    end

    it 'sign out user' do
      expect(subject.current_user).to be_nil
    end

    it 'reddirect user to root page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
