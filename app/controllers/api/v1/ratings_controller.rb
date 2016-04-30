module Api
  module V1
    class RatingsController < ApplicationController
      include ResourceLoader

#      before_action :set_resource, only: [:show, :update, :confirm_by_venue, :confirm_by_artist]
      before_action :set_location, only: [:create]
      before_action :set_category, only: [:create]

      def create
        # eventually need to add user in here
        @rating = @location.ratings.new(rating: Rating.ratings[params[:rating]], category: @category) # , user: current_user)
        if @rating.save
          render 'create.json.jbuilder', status: :created
        else
          render json: { errors: @rating.errors.messages }
        end
      end


      private

      def set_location
        @location = Location.find(params[:location_id])
      end

      def set_category
        @category = Category.find_by_name(params[:category])
        # need to find a way to do custom error message here
        raise ActiveRecord::RecordNotFound if @category.nil?
      end
    end
  end
end