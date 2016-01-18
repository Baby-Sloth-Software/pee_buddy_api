module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: [:update, :destroy]

      def login
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          render 'login.json.jbuilder', status: :ok
        else
          render json: { errors: { detail: "Username or Password incorrect." } }, status: :unauthorized
        end
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render 'create.json.jbuilder', status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
      end

      def destroy
      end

      private
      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
