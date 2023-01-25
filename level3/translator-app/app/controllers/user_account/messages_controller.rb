# frozen_string_literal: true

module UserAccount
  class MessagesController < UserAccount::ApplicationController
    def index
      @pagy, @messages = pagy(Message.includes(:user, :tag).order(created_at: :desc).all)
      @tags = Tag.all
    end

    def show
      @message = Message.includes(:user, :tag).find(params[:id])
    end

    def create
      @message = Message.new(messages_params.merge(user_id: current_user.id))

      if @message.save
        flash[:success] = 'Message created'
      else
        flash[:error] = 'Error on message'
      end

      pp @message.errors

      redirect_to user_account_messages_path
    end

    private

    def messages_params
      params.require(:message).permit(:french_content, :piou_content, :tag_id)
    end
  end
end
