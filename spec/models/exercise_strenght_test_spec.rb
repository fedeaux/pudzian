require 'rails_helper'

RSpec.describe ExerciseStrenghtTest, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(create :exercise_strenght_test).to be_valid
    end
  end
end
