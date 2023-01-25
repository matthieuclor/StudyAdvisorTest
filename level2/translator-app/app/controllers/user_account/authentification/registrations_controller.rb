# frozen_string_literal: true

module UserAccount
  module Authentification
    class RegistrationsController < Devise::RegistrationsController
      include SkipBullet

      before_action :configure_sign_up_params, only: :create
      before_action :configure_account_update_params, only: :update
      around_action :skip_bullet, only: :destroy

      def new # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def create # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def edit # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      def update
        # if update_resource(current_user, account_update_params)
        if resource.update_without_password(account_update_params)
          # set_flash_message_for_update(resource, current_user.unconfirmed_email)
          bypass_sign_in(current_user, scope: :user) if sign_in_after_change_password?
        else
          flash[:error] = resource.errors.full_messages.first
          clean_up_passwords(current_user)
        end

        pp resource.errors

        redirect_to user_account_messages_path
      end

      def destroy # rubocop:disable Lint/UselessMethodDefinition
        super
      end

      protected

      def configure_sign_up_params
        devise_parameter_sanitizer.permit(
          :sign_up,
          keys: %i(first_name last_name language)
        )
      end

      def configure_account_update_params
        devise_parameter_sanitizer.permit(
          :account_update,
          keys: %i(first_name last_name language)
        )
      end

      def after_sign_up_path_for(_resource)
        user_account_dashboards_path
      end

      def after_inactive_sign_up_path_for(_resource)
        user_account_dashboards_path
      end
    end
  end
end
