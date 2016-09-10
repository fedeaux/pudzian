require 'rails_helper'

RSpec.describe StrenghtBasedProgression, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(create :strenght_based_progression).to be_valid
    end
  end

  describe '#string_repetitions_signature=' do
    it 'creates a RepetitionsSignature and assign relationships if RepetitionsSignature does not exist for this user' do
      string_signature = '9/  12 /  15 90s /12'
      progression = create :strenght_based_progression, string_repetitions_signature: string_signature

      repetitions_signature = RepetitionsSignature.first

      expect(repetitions_signature.signature).to eq RepetitionsSignature.normalize string_signature
      expect(progression.repetitions_signature_id).to eq repetitions_signature.id
    end

    it 'fetches a RepetitionsSignature and assign relationships if RepetitionsSignature does exist for this user' do
      repetitions_signature = create :repetitions_signature
      progression = create :strenght_based_progression, string_repetitions_signature: repetitions_signature.
        signature.gsub('(\d+)', '  \\1  ') # Resistent to unnormalized signatures

      expect(progression.repetitions_signature_id).to eq repetitions_signature.id
    end

    it 'caches the string until a user is set' do
      string_repetitions_signature = attributes_for(:strenght_based_progression)[:string_repetitions_signature]
      progression = build :strenght_based_progression, user: nil

      expect(progression).not_to be_valid
      expect(progression.repetitions_signature).to be nil
      progression.user = create_or_find_user :user_ray
      expect(progression.repetitions_signature.signature).to eq RepetitionsSignature.normalize string_repetitions_signature
    end
  end
end
