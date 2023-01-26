# frozen_string_literal: true

module Api
  class MessagesController < Api::ApplicationController
    def index
      @pagy, @messages = pagy(Message.includes(:user, :tag).order(created_at: :desc).all)
    end

    def show
      @message = Message.find(params[:id])
    end
  end
end
