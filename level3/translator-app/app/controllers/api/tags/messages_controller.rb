# frozen_string_literal: true

module Api
  module Tags
    class MessagesController < Api::ApplicationController
      def index
        @pagy, @messages = pagy(Message.includes(:user, :tag).where(tags: { name: params[:tag_name] }))
      end
    end
  end
end
