class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:person_id]
          Current.person=Person.find_by(id:session[:person_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert:"You are not logged in" if Current.person.nil?
    end

end
