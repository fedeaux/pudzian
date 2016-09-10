require 'rails_helper'

RSpec.describe RepetitionsSignature, type: :model do
  describe 'factories' do
    it 'has valid factories' do
      expect(create :repetitions_signature).to be_valid
    end
  end

  describe '.normalize' do
    it 'ignores empty strings' do
      expect(RepetitionsSignature.normalize('     ')).to eq ''
    end

    it 'strips unnecessary whitespace' do
      expect(RepetitionsSignature.normalize(' 9/   12/ 9 /   12   90s    ')).to eq '9/12/9/12 90s'
      expect(RepetitionsSignature.normalize(' 6 15s/12    90s/   6   15s  /12 90s  ')).to eq '6 15s/12 90s/6 15s/12 90s'
    end

    it 'removes unknown characters' do
      expect(RepetitionsSignature.normalize(' 6 15s/12  alface  90s/ $$%  6 mbs  15s  /12 90s  ')).to eq '6 15s/12 90s/6 15s/12 90s'
    end

    it 'removes leading and trailing slashes' do
      expect(RepetitionsSignature.normalize('/// 6 15s/12  alface  90s/ $$%  6 mbs  15s  /12 90s /// ')).to eq '6 15s/12 90s/6 15s/12 90s'
    end

    it 'normalizes the signature on set' do
      repetitions_signature = create :repetitions_signature
      repetitions_signature.signature= '/// 6 15s/12  alface  90s/ $$%  6 mbs  15s  /12 90s /// '
      expect(repetitions_signature.signature).to eq '6 15s/12 90s/6 15s/12 90s'
    end
  end
end
