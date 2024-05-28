class SessionsController < ApplicationController
     def destroy
        session[:person_id]=nil
        redirect_to root_path, notice:"Good_bye, Logged out Successfully"
     end

     def new
        
     end

     def create
        person=Person.find_by(email:params[:email])

       if person.present? && person.authenticate(params[:password])
        session[:person_id]=person.id
        redirect_to root_path, notice:"Logged in Successfully"
       else
        flash[:alert]="Invalid Credentials"
        render :new
       end
     end
end