class OrganizationGoalCompletedsController < ApplicationController
  def create
    @organization_goal = OrganizationGoal.find(params[:organization_goal_id])
    @organization_goal.completed = OrganizationGoalCompleted.new(
      organization_goal_id: @organization_goal.id,
      completed_by_id: current_user.id
    )
    @organization_goal.save
    redirect_to organizations_path
  end

  def destroy
    @organization_goal_completed = OrganizationGoalCompleted.find(params[:id])
    @organization_goal = @organization_goal_completed.organization_goal
    @organization_goal.completed.destroy
    redirect_to organizations_path
  end
end
