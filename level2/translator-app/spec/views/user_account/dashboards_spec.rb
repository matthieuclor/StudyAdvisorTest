# frozen_string_literal: true

describe "Dashboard page", type: :feature do
  fixtures :users

  before do
    @user = users(:matthieu)
    visit '/users/sign_in'
    fill_in('Email', with: @user.email)
    fill_in('Password', with: 'password01')
    click_button('Log in')
  end

  it "render dashboard page" do
    expect(page).to have_content('Dashboard')
  end

  describe "when i click on sign out link" do
    it "redirect to home page" do
      click_link('Log out')

      expect(current_path).to eq('/')
    end
  end
end
