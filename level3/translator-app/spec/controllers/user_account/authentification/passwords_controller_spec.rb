# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserAccount::Authentification::PasswordsController, type: :controller do
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

  describe "GET edit" do
    it "renders the edit template" do
      get :edit, params: { reset_password_token: users(:matthieu).reset_password_token }

      expect(response).to render_template("edit")
    end
  end
end
