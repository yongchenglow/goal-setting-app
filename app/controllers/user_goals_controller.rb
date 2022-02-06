class UserGoalsController < ApplicationController
  before_action :set_user_goal, only: %i[update destroy]

  def index
    @user_goals = UserGoal.where("created_by_id = #{current_user.id}").order(created_at: :desc)
    @user_goals_completed = @user_goals.filter { |user_goal| user_goal.completed.present? }
    @user_goals_in_progress = @user_goals.reject { |user_goal| user_goal.completed.present? }
  end

  def create
    @user_goal = UserGoal.new(user_goal_params)
    @user_goal.description.present?
    @user_goal.created_by_id = current_user.id
    @user_goal.save

    redirect_to user_goals_path
  end

  def update
    @user_goal.update(user_goal_params)

    redirect_to user_goals_path
  end

  def destroy
    @user_goal.destroy

    redirect_to user_goals_path
  end

  private

  def set_user_goal
    @user_goal = UserGoal.find(params[:id])
  end

  def user_goal_params
    params.require(:user_goal).permit(:description).merge(updated_by_id: current_user.id)
  end
end
