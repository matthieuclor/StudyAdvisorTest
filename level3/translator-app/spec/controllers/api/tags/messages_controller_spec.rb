# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Tags::MessagesController, type: :controller do
  fixtures :users

  before do
    @user = users(:matthieu)
    @jwt_token = @user.generate_jwt
    request.headers["ACCEPT"] = 'application/json'
  end

  it 'should render message with good token' do
    request.headers["Authorization"] = @jwt_token
    get :index, params: { tag_name: 'Urgent' }

    expect(response.status).to eq(200)
  end
end
