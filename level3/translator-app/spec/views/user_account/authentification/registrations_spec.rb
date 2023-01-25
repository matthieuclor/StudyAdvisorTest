# frozen_string_literal: true

describe "Registration page", type: :feature do
  fixtures :users

  before do
    visit '/users/sign_up'
  end

  it "render sign up form" do
    expect(page).to have_field('user[first_name]', type: 'text')
    expect(page).to have_field('user[last_name]', type: 'text')
    expect(page).to have_field('user[email]', type: 'email')
    expect(page).to have_field('user[password]', type: 'password')
    expect(page).to have_field('user[password_confirmation]', type: 'password')
  end

  describe "when i fill the sign up form" do
    it "redirect to the dashboard page" do
      new_user = build(:user)

      fill_in('First name', with: new_user.first_name)
      fill_in('Last name', with: new_user.last_name)
      fill_in('Email', with: new_user.email)
      fill_in('Password', with: 'password03')
      fill_in('Password confirmation', with: 'password03')
      click_button('Sign up')

      expect(current_path).to eq('/user_account/dashboards')
    end
  end
end
