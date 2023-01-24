# frozen_string_literal: true

describe "home page", type: :feature do
  before do
    visit '/'
  end

  it "render home page" do
    expect(page).to have_content('Welcome to the Piou Piou translator app !')
  end

  describe "when i click on Sign in link" do
    it "redirect to sign in view" do
      click_link('Sign in')

      expect(current_path).to eq('/users/sign_in')
    end
  end

  describe "when i click on Sign up link" do
    it "redirect to sign up view" do
      click_link('Sign up')

      expect(current_path).to eq('/users/sign_up')
    end
  end
end
