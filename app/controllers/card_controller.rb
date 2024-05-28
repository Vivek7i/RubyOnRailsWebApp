class CardController < ApplicationController
    before_action:require_user_logged_in!
    before_action:set_card, only: [:show, :edit, :update, :destroy]
    before_action:correct_user, only: [:edit, :update, :destroy]

    def index
       
    end
    def show
        @cards = Current.person.cards
    end
    def new
        @card=Card.new
    end
    def create
        @card=Card.new(card_params)
        if @card.save
          redirect_to root_path, notice:"Successfully Card created"
        else
          flash[:alert]="Something went wrong"
          render :new
        end
      end


      def edit
      end
      def update
        if @card.update(card_params)
          redirect_to root_path, notice: 'Card was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @card.destroy
        redirect_to cards_url, notice: 'Card was successfully destroyed.'
      end
      private

      def correct_user
        @card = Current.person.cards.find_by(id: params[:id])
        redirect_to cards_path, notice: 'Not authorized to edit this card' if @card.nil?
      end

      def card_params
          params.require(:card).permit(:title,:description,:image_url)
      end

      def set_card
        @card = Card.find(params[:id])
      end
end


  