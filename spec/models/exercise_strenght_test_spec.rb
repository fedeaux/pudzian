require 'rails_helper'

RSpec.describe ExerciseStrenghtTest, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(create :exercise_strenght_test).to be_valid
    end
  end

  describe '.default_mr_weights' do
    it 'returns a hash with the REPETITION_REGIONS set to -1' do
      expect(ExerciseStrenghtTest.default_mr_weights.keys).to eq ExerciseStrenghtTest::REPETITION_REGIONS
      expect(ExerciseStrenghtTest.default_mr_weights.values.uniq.first).to eq (-1)
    end
  end

  describe '#mr_weights' do
    let(:exercise_strenght_test) { create :exercise_strenght_test }

    it 'can be retrieved' do
      expect(exercise_strenght_test.mr_weights.keys).to eq ExerciseStrenghtTest::REPETITION_REGIONS
    end
  end
end
