class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @pet = current_user.pets
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to users_my_page_path
    else
      @user = current_user
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :introduction, :nickname, :phone_number, :profile_image)
  end
end