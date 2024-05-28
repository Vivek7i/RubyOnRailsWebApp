class PasswordsController < ApplicationController
    before_action :require_user_logged_in!
  
    def edit
    end
  
    def update
      if Current.person.update(password_params)
        redirect_to root_path, notice: "Password updated!"
      else
        render :edit
      end
    end
  
    private
  
    def password_params
      params.require(:person).permit(:password, :password_confirmation)
    end
  end