module Api
  module V1
    class PurchasesController < Api::V1::BaseController
      before_action :authenticate, only: %i[create]

      resource_description do
        short 'Purchases information resources'
        formats ['json']
      end

      def_param_group :purchase_params do
        param :purchase, Hash do
          param :purchaseable_id, String, required: true
          param :purchaseable_type, String, required: true, description: 'Movie or Season'
          param :video_quality, String, required: true, description: 'HD or SD'
        end
      end

      api :POST, '/v1/purchases.json', 'Creates purchase for user'
      example '{"purchase":{}}'
      error code: 401, desc: 'Unauthenticated'
      error code: 409, desc: 'Conflict'
      def create
        purchase_form = PurchaseForm.new(purchase_params.merge(user: @user))
        if purchase_form.persist?
          render json: purchase_form.purchase, status: 201
        else
          render json: { errors: purchase_form.errors.full_messages }, status: 409
        end
      end

      private

      def purchase_params
        params.require(:purchase).permit(:purchaseable_id, :purchaseable_type, :video_quality)
      end
    end
  end
end
