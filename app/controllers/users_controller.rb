class UsersController < ApplicationController
  before_action :set_user
  def profile
    if @admin_user.present?
      @users = User.where.not(user_type: "Admin")
      @user = User.find_by(id: params[:id])
      render 'users/list'
    end
  end

  def show_profile
    @user = User.find_by(id: params[:id])
    render 'users/profile'
  end

  def edit_profile
    @user = User.find_by(id: params[:id])
    @user.picture.attach(user_params[:picture]) if user_params[:picture].present?
    @user.update(user_params.as_json.except('picture'))
    render "users/profile"
  end

  def show_admin_profile
    render 'users/edit_admin'
  end

  def edit_admin_profile
    @admin_user = User.find_by(id: params[:id])
    @admin_user.picture.attach(user_params[:picture]) if user_params[:picture].present?
    @admin_user.update(user_params.as_json.except('picture'))
    render 'users/edit_admin'
  end

  def set_user
    if current_user.user_type == "Admin"
      @admin_user = current_user
    else
      @user = current_user
    end
  end

  def user_params
    params.require(:user).permit(:name,:phone_number,:address_line,:landmark,:street,:city,:state,:pin_code, :picture)
  end
end
