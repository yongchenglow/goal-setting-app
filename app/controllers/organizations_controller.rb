class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    if current_user.user_organization
      @organization_goals = OrganizationGoal
                            .where("organization_id = #{current_user.user_organization.organization.id}")
                            .order(created_at: :desc)
      @organization_goals_completed = @organization_goals
                                      .filter { |organization_goal| organization_goal.completed.present? }
      @organization_goals_in_progress = @organization_goals
                                        .reject { |organization_goal| organization_goal.completed.present? }
    else
      @organization_goals = []
      @organization_goals_completed = []
      @organization_goals_in_progress = []
    end
  end

  def create
    unless current_user.user_organization
      @organization = Organization.new(organization_params)
      @organization.created_by_id = current_user.id
      if @organization.save
        @user_organization = UserOrganization.new
        @user_organization.user_id = current_user.id
        @user_organization.created_by_id = current_user.id
        @user_organization.organization_id = @organization.id
        @user_organization.save
      end
    end

    redirect_to organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name).merge(updated_by_id: current_user.id)
  end
end
