require 'rails_helper'

RSpec.describe Tag, type: :model do
  fixtures :tags

  before do
    @tag = tags(:urgent)
  end

  context "create Tag" do
    it "should be valid" do
      expect(@tag.valid?).to be_truthy
    end
  end

  %i(name).each do |attibute|
    it "should be invalid without #{attibute}" do
      @tag.send("#{attibute}=", nil)

      expect(@tag.valid?).to be_falsy
      expect(@tag.errors[attibute].present?).to be_truthy
    end
  end
end
