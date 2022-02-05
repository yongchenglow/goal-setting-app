class TeamGoalCompletedsController < ApplicationController
  def create
    @team_goal = TeamGoal.find(params[:team_goal_id])
    @team_goal.completed = TeamGoalCompleted.new(
      team_goal_id: @team_goal.id,
      completed_by_id: current_user.id
    )
    @team_goal.save
    redirect_to @team_goal.team
  end

  def destroy
    @team_goal_completed = TeamGoalCompleted.find(params[:id])
    @team_goal = @team_goal_completed.team_goal
    @team_goal.completed.destroy
    redirect_to @team_goal.team
  end
end
