after :exercise_categories do
  CSV.parse(open('https://docs.google.com/spreadsheets/d/1JgK9V-eiYrIYPnouljDnqCKGa0gO2I4Q9UQBcFxoWKA/pub?output=csv').read).each_with_index do |line, index|
    name = line[1].try(:strip)
    next if index == 0 or name.nil? or name.blank?

    exercise = Exercise.where(id: line[0].to_i).first_or_initialize
    exercise.assign_attributes(name: name)

    exercise.categories = line[2..6].map{ |category_name|
      ExerciseCategory.find_by(name: category_name.strip) if category_name
    }.reject(&:nil?)

    unless exercise.save
      ap exercise.errors
      break
    end
  end

  ActiveRecord::Base.connection.execute("ALTER SEQUENCE exercises_id_seq RESTART WITH #{Exercise.pluck(:id).max + 1}")
  puts "Sed #{Exercise.count} exercises"
end
