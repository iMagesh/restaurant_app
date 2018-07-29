module Api
  module V1
    class GuestsController < ApplicationController

      def create
        @guest = Guest.new(permitted_params)
        if @guest.save
          render json: @guest, status: 200
        else
          render json: {error: true,errors: @guest.errors.full_messages.join(", ")}, status: 403
        end
      end

      private

      def permitted_params
        params.require(:guest).permit(
          :name,
          :email
        )
      end

    end
  end
end