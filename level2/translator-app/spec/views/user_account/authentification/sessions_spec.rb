# frozen_string_literal: true

describe "Session page", type: :feature do
  fixtures :users

  before do
    visit '/users/sign_in'
  end

  it "render sign in form" do
    expect(page).to have_field('user[email]', type: 'email')
    expect(page).to have_field('user[password]', type: 'password')
  end

  describe "when i fill the sign in form" do
    it "redirect to the dashboard page" do
      @user = users(:matthieu)

      fill_in('Email', with: @user.email)
      fill_in('Password', with: 'password01')
      click_button('Log in')

      expect(current_path).to eq('/user_account/dashboards')
    end
  end
end
