class TeamsController < ApplicationController
  before_action :set_team, only: %i[update destroy]

  def index
    @teams = Team.all
  end

  def create
    if current_user.user_organization
      @team = Team.new(team_params)
      @team.created_by_id = current_user.id
      @team.organization_id = current_user.user_organization.organization_id
      @team.save
    end

    redirect_to organizations_path
  end

  def update
    @team.update(team_params)

    redirect_to organizations_path
  end

  def destroy
    @team.destroy

    redirect_to organizations_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name).merge(updated_by_id: current_user.id)
  end
end
