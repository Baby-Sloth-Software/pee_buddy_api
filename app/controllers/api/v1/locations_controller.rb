module Api
  module V1
    class LocationsController < ApplicationController
      #before_action :authenticate_user!
      #include ResourceLoader
      #before_action :set_resource, only: [:show, :update, :confirm_by_venue, :confirm_by_artist]

      def index
        @locations = Location.all
        render "index.json.jbuilder", status: :ok
      end

      def create
        locations = params["locations"]
        @data = locations.map do |location|
          Location.find_or_create_by!(
              place_id: location["place_id"],
              lat: location["location"]["lat"].to_f,
              lng: location["location"]["lng"].to_f,
              name: location["name"]
          )
        end
        render "create.json.jbuilder", status: :ok
      end

      def show
      end

    end
  end
end