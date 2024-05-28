class RegistrationsController < ApplicationController
    def new
        @person=Person.new
      
    end
    def create
        
      @person=Person.new(user_params)
      if @person.save
        session[:person_id]=@person.id 
        redirect_to root_path, notice:"Successfully registered"
      else
        flash[:alert]="Something went wrong"
        render :new
      end
    end
    private

    def user_params
        params.require(:person).permit(:email,:password,:password_confirmation)
    end
end