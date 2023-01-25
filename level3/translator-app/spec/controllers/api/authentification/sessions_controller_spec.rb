# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::Authentification::SessionsController, type: :controller do
  fixtures :users

  before do
    @user = users(:matthieu)
  end

  it 'should sign in user' do
    post :create, params: {
      user: {
        email: @user.email,
        password: 'password01'
      }
    }, as: :json

    user = assigns(:user)
    jwt_token = assigns[:jwt_token]
    jwt_payload = JWT.decode(jwt_token, Rails.application.secrets.secret_key_base).first

    expect(user.id).to eq(@user.id)
    expect(user.id).to eq(jwt_payload['id'])
    expect(response.status).to eq(204)
  end

  it 'should not sign in with wrong password' do
    post :create, params: {
      user: {
        email: @user.email,
        password: 'testtest'
      }
    }, as: :json

    expect(response.status).to eq(401)
  end
end
