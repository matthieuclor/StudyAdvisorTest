# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::MessagesController, type: :controller do
  fixtures :users, :messages

  before do
    @user = users(:matthieu)
    @message = messages(:test)
    @jwt_token = @user.generate_jwt
    request.headers["ACCEPT"] = 'application/json'
  end

  it 'should render unauthorized with wrong token' do
    request.headers["Authorization"] = 'bad_token_test'
    get :index

    expect(response.status).to eq(401)
  end

  it 'should render unauthorized with expired token' do
    @expired_jwt_token = JWT.encode(
      { id: @user.id, exp: 1.day.ago.to_i },
      Rails.application.secrets.secret_key_base
    )

    request.headers["Authorization"] = @expired_jwt_token
    get :index

    expect(response.status).to eq(401)
  end

  it 'should render messages with good token' do
    request.headers["Authorization"] = @jwt_token
    get :index

    expect(response.status).to eq(200)
  end

  it 'should render message with good token' do
    request.headers["Authorization"] = @jwt_token
    get :show, params: { id: @message.id }

    expect(response.status).to eq(200)
  end
end
