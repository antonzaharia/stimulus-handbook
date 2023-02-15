class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])

    if @user
      @user.update!(user_params)
      redirect_to edit_user_registration_path(@user), info: 'Details updated successfully'
    else
      redirect_to dashboard_path, info: 'User not found'
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to edit_user_registration_path(@user), error: e.message
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end