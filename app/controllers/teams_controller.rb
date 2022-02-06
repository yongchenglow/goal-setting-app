class TeamsController < ApplicationController
  before_action :set_team, only: %i[show update destroy]

  def index
    if current_user.user_organization
      @teams = current_user.user_organization.organization.teams
      @user_teams = current_user.user_teams
      @teams = @teams.reject { |team| @user_teams.any? { |user_team| user_team.team == team } }
    else
      @teams = []
    end
  end

  def show
    @team_goal = TeamGoal.new(team_id: @team.id)
    @team_goals = TeamGoal.where("team_id = #{@team.id}").order(created_at: :desc)
    @team_goals_completed = @team_goals.filter { |team_goal| team_goal.completed.present? }
    @team_goals_in_progress = @team_goals.reject { |team_goal| team_goal.completed.present? }
  end

  def create
    if current_user.user_organization
      @team = Team.new(team_params)
      @team.created_by_id = current_user.id
      @team.organization_id = current_user.user_organization.organization_id
      @team.save
    end

    redirect_to teams_path
  end

  def update
    @team.update(team_params)

    redirect_to teams_path
  end

  def destroy
    @team.destroy

    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name).merge(updated_by_id: current_user.id)
  end
end
