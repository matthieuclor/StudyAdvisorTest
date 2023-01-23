require './piou_translator/piou_translator'

RSpec.describe PiouTranslator do
  describe 'default action argument' do
    before(:each) do
      @piou_translator = PiouTranslator.new('foo')
    end

    it 'should be from encode by default' do
      expect(@piou_translator.action).to eq('encode')
    end
  end

  describe 'wrong arguments' do
    it 'raise an ArgumentError on action' do
      expect {
        PiouTranslator.new('foo', 'bar')
      }.to raise_error(ArgumentError)
    end

    it 'raise an ArgumentError on text' do
      expect { PiouTranslator.new({}) }.to raise_error(ArgumentError)
    end
  end

  describe 'french to piou translation' do
    before(:each) do
      @piou_translator = PiouTranslator.new('foo bar')
    end

    it 'should be succeed' do
      expect(@piou_translator.success).to be_truthy
    end

    it 'should translate french to piou' do
      text = 'pipp uiui uiui  ioup piou iupi'
      expect(@piou_translator.result).to eq(text)
    end
  end

  describe 'piou to french translation' do
    before(:each) do
      text = 'pipp uiui uiui  ioup piou iupi'
      @piou_translator = PiouTranslator.new(text, 'decode')
    end

    it 'should be succeed' do
      expect(@piou_translator.success).to be_truthy
    end

    it 'should translate french to piou' do
      expect(@piou_translator.result).to eq('FOO BAR')
    end
  end
end
