class PasswordResetsController < ApplicationController
    def new
    end
  
    def create
      @person = Person.find_by(email: params[:email])
  
      if @person.present?
        # Send email
        PasswordMailer.with(person: @person).reset.deliver_now
      end
  
      redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
    end
  
    def edit
      @person = Person.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token has expired. Please try again."
    end
  
    def update
      @person = Person.find_signed!(params[:token], purpose: "password_reset")
      if @person.update(password_params)
        redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
      else
        render :edit
      end
    end
  
    private
  
    def password_params
      params.require(:person).permit(:password, :password_confirmation)
    end
  end