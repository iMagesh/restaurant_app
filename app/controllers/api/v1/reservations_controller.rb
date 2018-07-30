module Api
  module V1
    class ReservationsController < ApplicationController

      def index
        restaurant = Restaurant.find(params[:id])
        if !restaurant.reservations.empty?
          render json: restaurant.reservations.api_format, status: 200
        else
          render json: {}, error: "Sorry, No reservations"
        end
      end

      def create
        guest = Guest.find_by(email: params[:reservation][:guest_email])
        guest = Guest.register(params[:reservation][:guest_email], params[:reservation][:guest_name]) if guest.nil?
        restaurant_table = RestaurantTable.find(params[:reservation][:restaurant_table_id])
        params[:reservation][:guest_id] = guest.id
        reservation = restaurant_table.reservations.new(permitted_params)
        if reservation.save
          render json: reservation, status: 200
        else
          render json: {error: true,errors: reservation.errors.full_messages.join(", ")}, status: 403
        end
      end

      def update
        reservation = Reservation.find(params[:id])
        if reservation.update(permitted_params)
          render json: reservation, status: 200
        else
          render json: {error: true,errors: reservation.errors.full_messages.join(", ")}, status: 403
        end
      end

      private

      def permitted_params
        params.require(:reservation).permit(
          :restaurant_table_id,
          :guest_id,
          :guests_count,
          :reservation_from,
          :reservation_to,
          :restaurant_shift_id
        )
      end

    end
  end
end