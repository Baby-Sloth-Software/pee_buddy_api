module Api
  module V1
    class RaterController < ApplicationController
      before_action :authenticate_user!

      def create
        binding.pry
        obj = params[:klass].classify.constantize.find(params[:id])
        obj.rate params[:score].to_f, current_user, params[:dimension]

        render :json => true
      end
    end
  end
end
