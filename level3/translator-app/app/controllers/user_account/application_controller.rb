# frozen_string_literal: true

module UserAccount
  class ApplicationController < ActionController::Base
    include Pagy::Backend

    layout 'user_account/layouts/application'

    before_action :authenticate_user!
  end
end
