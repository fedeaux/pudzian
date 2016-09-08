require 'rails_helper'

RSpec.describe Exercise, type: :model do
  context 'factory' do
    it 'has a valid factory' do
      expect(create :exercise_benchpress).to be_valid
    end

    it 'has a valid factory with categories' do
      exercise = create :exercise_benchpress, :with_categories

      expect(exercise).to be_valid
      expect(exercise.categories).not_to be_empty
    end
  end

  context 'categories' do
    let(:exercise) { create :exercise_benchpress }
    let(:category) { create(:exercise_category) }
    let(:exercise_with_categories) { create(:exercise_benchpress, :with_categories) }

    it 'can be added categories' do
      expect(exercise.categories).to be_empty

      exercise.categories << category
      exercise.save

      expect(exercise.categories).to include category
      expect(category.exercises).to include exercise
    end

    it 'can be removed categories' do
      categories = exercise_with_categories.categories
      number_of_categories = categories.count
      category = categories.first

      exercise.categories = categories[1..-1]
      exercise.save

      expect(exercise.categories.count).to eq number_of_categories - 1
      expect(exercise.categories).not_to include exercise
      expect(category.exercises).not_to include category
    end
  end
end
