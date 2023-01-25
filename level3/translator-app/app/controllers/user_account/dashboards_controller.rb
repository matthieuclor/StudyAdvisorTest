# frozen_string_literal: true

module UserAccount
  class DashboardsController < UserAccount::ApplicationController
    def index
      @users_count = User.count
      @messages_count = Message.count
      @tags_count = Tag.count
    end
  end
end
