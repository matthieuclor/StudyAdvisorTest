# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserAccount::Tags::MessagesController, type: :controller do
  fixtures :users

  before do
    sign_in users(:matthieu), scope: :user
  end

  describe "GET index" do
    it "renders the index template" do
      get :index, params: { tag_name: 'Urgent' }
      expect(response).to render_template("index")
    end
  end
end
