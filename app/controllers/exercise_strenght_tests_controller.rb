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

  private
    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:name, :user_id)
    end
end
