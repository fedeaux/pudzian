class ExerciseStrenghtTestsController < ApplicationController
  # GET /exercises
  def index
    if params[:exercise_id]
      @exercise_strenght_test = Exercise.find(params[:exercise_id]).strenght_test current_user
      if @exercise_strenght_test
        render :show
      else
        head 200
      end
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:name, :user_id)
    end
end
