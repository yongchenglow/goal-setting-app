class UserGoalCompletedsController < ApplicationController
  def create
    @user_goal = UserGoal.find(params[:user_goal_id])
    @user_goal.completed = UserGoalCompleted.new(user_goal_id: @user_goal.id, completed_by_id: current_user.id)
    @user_goal.save
    redirect_to user_goals_path
  end

  def destroy
    @user_goal_completed = UserGoalCompleted.find(params[:id])
    @user_goal = @user_goal_completed.user_goal
    @user_goal.completed.destroy
    redirect_to user_goals_path
  end
end
