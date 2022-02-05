class UserTeamsController < ApplicationController
  def create
    @user_team = UserTeam.new
    @team = Team.find(params[:format])
    @user_team.created_by_id = current_user.id
    @user_team.team_id = @team.id
    @user_team.user_id = current_user.id
    @user_team.save

    redirect_to teams_path
  end

  def destroy
    @user_team = UserTeam.find(params[:id])
    @user_team.destroy

    redirect_to teams_path
  end
end
