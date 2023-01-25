require 'rails_helper'

RSpec.describe Message, type: :model do
  fixtures :messages, :users

  before do
    @message = messages(:test)
    @user = users(:matthieu)
  end

  context "create Message" do
    it "should be valid" do
      expect(@message.valid?).to be_truthy
    end
  end

  %i(user).each do |attibute|
    it "should be invalid without #{attibute}" do
      @message.send("#{attibute}=", nil)

      expect(@message.valid?).to be_falsy
      expect(@message.errors[attibute].present?).to be_truthy
    end
  end
end
