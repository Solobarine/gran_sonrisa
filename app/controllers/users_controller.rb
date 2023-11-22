class UsersController < ApplicationController
  def show; end

  def update
    # Get User
    @user = User.find_by(id: current_user.id)
    # Check if Avatar is Empty
    return if avatar_empty?

    # Check if Avatar Attached
    @user.avatar.purge if @user.avatar.attached?

    if @user.avatar.attach(params[:avatar])
      puts 'success'
      redirect_to profile_path, notice: 'Avatar Updated Successfully'
    else
      puts 'error occurred'
      redirect_to profile_path, notice: 'Avatar Upload Failed'
    end
  end

  def dashboard
    redirect_to cars_path unless current_user.admin
  end

  private

  def avatar_empty?
    params[:avatar].nil?
  end
end
