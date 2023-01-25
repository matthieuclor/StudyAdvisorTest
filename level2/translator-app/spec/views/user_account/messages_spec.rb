# frozen_string_literal: true

describe "Messages page", type: :feature do
  fixtures :users

  before do
    @user = users(:matthieu)
    visit '/users/sign_in'
    fill_in('Email', with: @user.email)
    fill_in('Password', with: 'password01')
    click_button('Log in')
  end

  it "render messages page" do
    expect(page).to have_content('Messages')
  end
end
