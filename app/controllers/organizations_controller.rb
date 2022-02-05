class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
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
