require 'csv'
require 'open-uri'

CSV.parse(open('https://docs.google.com/spreadsheets/d/1hi7qVAoZXEdeNX7FeKkV1pEEGjKgHzsCMCPeQKpttSo/pub?output=csv').read).each_with_index do |line, index|
  next if index == 0

  exercise_category = ExerciseCategory.where(id: line[0].to_i).first_or_initialize

  exercise_category.assign_attributes(name: line[1], slug: line[2])
  exercise_category.save
end

puts "Sed #{ExerciseCategory.count} exercise categories"
