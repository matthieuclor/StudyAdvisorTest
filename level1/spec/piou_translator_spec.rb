require './piou_translator/piou_translator'

RSpec.describe PiouTranslator do
  describe 'default lang argument' do
    before(:each) do
      @piou_translator = PiouTranslator.new('foo')
    end

    it 'should be from fr by default' do
      expect(@piou_translator.from).to eq('fr')
    end

    it 'should be to piou by default' do
      expect(@piou_translator.to).to eq('piou')
    end
  end

  describe 'wrong lang argument' do
    it 'raise an ArgumentError' do
      expect(
        PiouTranslator.new('foo', { from: 'foo', to: 'bar' })
      ).to raise_error(ArgumentError)
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
      lang = { from: 'piou', to: 'fr' }
      text = 'pipp uiui uiui  ioup piou iupi'
      @piou_translator = PiouTranslator.new(text, lang)
    end

    it 'should be succeed' do
      expect(@piou_translator.success).to be_truthy
    end

    it 'should translate french to piou' do
      expect(@piou_translator.result).to eq('foo bar')
    end
  end

  describe 'wrong french text' do
    before(:each) do
      @piou_translator = PiouTranslator.new('foo %%%')
    end

    it 'should be not succeed' do
      expect(@piou_translator.success).to be_falsey
    end

    it 'should have an error message' do
      expect(@piou_translator.errors).to eq({
        words: ['%%%'],
        message: 'translation impossible'
      })
    end
  end

  describe 'wrong piou text' do
    before(:each) do
      lang = { from: 'piou', to: 'fr' }
      @piou_translator = PiouTranslator.new('pipp uiui uiui  ppp', lang)
    end

    it 'should be not succeed' do
      expect(@piou_translator.success).to be_falsey
    end

    it 'should have an error message' do
      expect(@piou_translator.errors).to eq({
        words: ['ppp'],
        message: 'translation impossible'
      })
    end
  end
end
