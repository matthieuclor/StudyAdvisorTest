# frozen_string_literal: true

require "rails_helper"

RSpec.describe Public::PagesController, type: :controller do
  describe "GET main" do
    it "renders the index template" do
      get :main
      expect(response).to render_template("main")
    end
  end
end
