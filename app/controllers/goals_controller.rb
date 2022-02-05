class GoalsController < ApplicationController
  before_action :set_goal, only: %i[update destroy]

  def index
    @goals = Goal.all
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.created_by_id = current_user.id
    @goal.save

    redirect_to goals_path
  end

  def update
    @goal.update(goal_params)

    redirect_to goals_path
  end

  def destroy
    @goal.destroy

    redirect_to goals_path
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:description).merge(updated_by_id: current_user.id)
  end
end
