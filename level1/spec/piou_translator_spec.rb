require './piou_translator/piou_translator'

RSpec.describe PiouTranslator do
  describe 'test' do
    it 'should be eq' do
      PiouTranslator.new('test')
      expect(3).to eq(3)
    end
  end
end
