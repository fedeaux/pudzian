require 'rails_helper'

RSpec.describe ExerciseCategory, type: :model do
  it 'has a valid factory' do
    expect(create :exercise_category).to be_valid
  end
end
