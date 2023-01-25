# frozen_string_literal: true

module UserAccount
  module Tags
    class MessagesController < UserAccount::ApplicationController
      def index
        @pagy, @messages = pagy(Message.includes(:user, :tag).where(tags: { name: params[:tag_name] }))
        @tags = Tag.all
      end
    end
  end
end
