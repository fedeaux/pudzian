require 'rails_helper'

RSpec.describe StrenghtBasedProgressionStep, type: :model do
  it 'has a valid factory' do
    expect(create :strenght_based_progression_step).to be_valid
  end
end
