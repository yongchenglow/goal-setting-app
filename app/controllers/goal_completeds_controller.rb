class GoalCompletedsController < ApplicationController
  def create
    @goal = Goal.find(params[:goal_id])
    @goal.completed = GoalCompleted.new(goal_id: :goal_id, completed_by_id: current_user.id)
    @goal.save
    redirect_to goals_path
  end

  def destroy
    @goal_completed = GoalCompleted.find(params[:id])
    @goal = @goal_completed.goal
    @goal.completed.destroy
    redirect_to goals_path
  end
end
