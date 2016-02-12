module Api
  module V1
    class LocationsController < ApplicationController
      before_action :authenticate_user!

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

        binding.pry
        
      end

    end
  end
end