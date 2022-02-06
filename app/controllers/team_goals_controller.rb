class TeamGoalsController < ApplicationController
  before_action :set_team_goal, only: %i[update destroy]

  def create
    p team_goal_params
    @team_goal = TeamGoal.new(team_goal_params)
    @team_goal.created_by_id = current_user.id
    @team_goal.save

    redirect_to @team_goal.team
  end

  def update
    @team_goal.update(team_goal_params)

    redirect_to @team_goal.team
  end

  def destroy
    @team_goal.destroy

    redirect_to @team_goal.team
  end

  private

  def set_team_goal
    @team_goal = TeamGoal.find(params[:id])
  end

  def team_goal_params
    params.require(:team_goal).permit(:description, :team_id).merge(updated_by_id: current_user.id)
  end
end
