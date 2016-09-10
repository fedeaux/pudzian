class ExerciseStrenghtTestsController < ApplicationController
  # GET /exercises
  def index
    if params[:exercise_id]
      exercise = Exercise.find params[:exercise_id]
      @exercise_strenght_test = exercise.strenght_test current_user
      @exercise_strenght_test = ExerciseStrenghtTest.new(exercise: exercise) unless @exercise_strenght_test
      render :show
    end
  end

  def create
    @exercise_strenght_test = ExerciseStrenghtTest.new exercise_strenght_test_params
    @exercise_strenght_test.user = current_user
    @exercise_strenght_test.save
    render :show
  end

  def update
    @exercise_strenght_test = ExerciseStrenghtTest.find params[:id]
    if @exercise_strenght_test.user.id == current_user.id
      @exercise_strenght_test.update exercise_strenght_test_params
      render :show
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def exercise_strenght_test_params
      params.require(:exercise_strenght_test).permit(:exercise_id, :precision, :unit, :mr_weights => ExerciseStrenghtTest::REPETITION_REGIONS.map(&:to_s))
    end
end
