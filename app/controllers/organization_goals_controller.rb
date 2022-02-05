class OrganizationGoalsController < ApplicationController
  before_action :set_organization_goal, only: %i[update destroy]

  def index
    @organization_goals = OrganizationGoal.all
  end

  def create
    @organization_goal = OrganizationGoal.new(organization_goal_params)
    @organization_goal.created_by_id = current_user.id
    @organization_goal.organization_id = current_user.user_organization.organization.id
    @organization_goal.save

    redirect_to organizations_path
  end

  def update
    @organization_goal.update(organization_goal_params)

    redirect_to organizations_path
  end

  def destroy
    @organization_goal.destroy

    redirect_to organizations_path
  end

  private

  def set_organization_goal
    @organization_goal = OrganizationGoal.find(params[:id])
  end

  def organization_goal_params
    params.require(:organization_goal).permit(:description).merge(updated_by_id: current_user.id)
  end
end
