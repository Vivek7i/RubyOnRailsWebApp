class CardzController < ApplicationController
    before_action :set_current_user
    before_action :require_user_logged_in!
    # before_action :set_cardz, only: [ :edit, :update, :destroy]
    # before_action :correct_user, only: [:show,:edit, :update, :destroy]

    def index
      @cardz=Cardz.find_by(person_id: session[:person_id])
    end
    def show
       
    end

    def new
        @cardz=Current.person.cardz.build
    end
    def create
        @cardz=Current.person.cardz.build(cardz_params)
        @cardz.save
        if @cardz.save
          redirect_to root_path, notice:"Successfully Card created"
        else
          flash[:alert]="Something went wrong"
          render :new
        end
      end


      def edit
        @cardz=Cardz.find(params[:id])
      end
      def update
        if @cardz.update(cardz_params)
          redirect_to root_path, notice: 'Card was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @cardz=Cardz.find(params[:id])
        @cardz.destroy!
        flash[:success] = "Card is deleted"
        redirect_to about_path , notice: 'Card was successfully destroyed.'
      end

      private

    #   def correct_user
    #     @cardz = Current.person.cardz
    #     redirect_to cards_path, notice: 'Not authorized to edit this card' if @cardz.nil?
    #   end

      def cardz_params
          params.require(:cardz).permit(:title,:content,:person_id)
      end

    #   def set_cardz
    #     @cardz = Current.person.cardz.find_by(id: params[:id])
    #     if @carfz.nil?
    #     flash[:danger] = "ToDo not found"
    #     redirect_to cardz_path
    #    end
        
    #   end
end


  