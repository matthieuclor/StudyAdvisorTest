# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserAccount::Authentification::RegistrationsController, type: :controller do
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
end
