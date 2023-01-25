require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  before do
    @user = users(:matthieu)
  end

  context "create User" do
    it "should be valid" do
      expect(@user.valid?).to be_truthy
    end

    %i(first_name last_name email language).each do |attibute|
      it "should be invalid without #{attibute}" do
        @user.send("#{attibute}=", nil)

        expect(@user.valid?).to be_falsy
        expect(@user.errors[attibute].present?).to be_truthy
      end
    end

    it 'should be invalid with the wrong email format' do
      @user.email = 'test.test.com'

      expect(@user.valid?).to be_falsy
      expect(@user.errors[:email].present?).to be_truthy
    end

    it 'should be invalid with exsting email' do
      new_user = build(:user, { email: @user.email })

      expect(new_user.valid?).to be_falsy
      expect(new_user.errors[:email].present?).to be_truthy
    end

    it 'should be invalid with the wrong password length' do
      @user.password = '12345'

      expect(@user.valid?).to be_falsy
      expect(@user.errors[:password].present?).to be_truthy
    end

    it 'capitalize first name before save' do
      @user.first_name = 'test'
      @user.save

      expect(@user.first_name).to eq('Test')
    end

    it 'capitalize last name before save' do
      @user.last_name = 'test'
      @user.save

      expect(@user.last_name).to eq('Test')
    end
  end
end
