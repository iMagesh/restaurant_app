module Api
  module V1
    class ReservationsController < ApplicationController

      def create
        @guest = Guest.find_by(email: params[guest_email])
        @restaurant_table = RestaurantTable.find(params[restaurant_table_id])
        @reservation = @restaurant_table.reservations.new(permitted_params)
        if @reservation.save
          render json: @reservation, status: 200
        else
          render json: {error: true,errors: @reservation.errors.full_messages.join(", ")}, status: 403
        end
      end

      private

      def permitted_params
        params.require(:reservation).permit(
          :restaurant_table_id,
          :guest_id,
          :guests_count,
          :reservation_from,
          :reservation_to
        )
      end

    end
  end
end