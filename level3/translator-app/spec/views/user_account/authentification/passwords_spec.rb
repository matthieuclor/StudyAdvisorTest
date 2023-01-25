# frozen_string_literal: true

describe "Registration page", type: :feature do
  fixtures :users

  before do
    visit '/users/password/new'
  end

  it "render password form" do
    expect(page).to have_field('user[email]', type: 'text')
  end

  describe "when i fill the password form" do
    before do
      fill_in('Email', with: users(:matthieu).email)
      click_button('Reset password')
    end

    it "redirect to the dashboard page" do
      expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.')
    end

    describe "when i visite the reset password pass into the mail" do
      before do
        visit "users/password/edit?reset_password_token=#{users(:matthieu).reset_password_token}"
      end

      it "redirect to the reset password form" do
        expect(page).to have_field('user[password]', type: 'password')
        expect(page).to have_field('user[password_confirmation]', type: 'password')
      end

      describe "when fill the reset password form" do
        it "reset the password" do
          fill_in('Password', with: 'password42')
          fill_in('Password confirmation', with: 'password42')
          click_button('Update')

          # expect(current_path).to eq('/')
        end
      end
    end
  end
end
