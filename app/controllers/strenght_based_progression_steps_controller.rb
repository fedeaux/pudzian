class StrenghtBasedProgressionStepsController < ApplicationController
  before_action :set_strenght_based_progression

  def index
    if @strenght_based_progression.user.id == current_user.id
      @steps = @strenght_based_progression.strenght_based_progression_steps
    else
      head 403
    end
  end

  def create
    if @strenght_based_progression.user.id == current_user.id
      @step = StrenghtBasedProgressionStep.new step_params
      @step.strenght_based_progression = @strenght_based_progression
      @step.save
      render :show
    else
      head 403
    end
  end

  private
  def set_strenght_based_progression
    @strenght_based_progression = StrenghtBasedProgression.find params[:strenght_based_progression_id]
  end

  def step_params
    params.require(:strenght_based_progression_step).permit(:id, :done_at, :strenght_level, :planned_set, :done_set)
  end
end
