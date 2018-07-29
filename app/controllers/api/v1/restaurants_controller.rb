module Api
  module V1
    class RestaurantsController < ApplicationController

      def create
        @restaurant = Restaurant.new(permitted_params)
        if @restaurant.save
          render json: @restaurant, status: 200
        else
          render json: {error: true,errors: @restaurant.errors.full_messages.join(", ")}, status: 403
        end
      end

      private

      def permitted_params
        params.require(:restaurant).permit(
          :name,
          :email,
          :phone
        )
      end

    end
  end
end