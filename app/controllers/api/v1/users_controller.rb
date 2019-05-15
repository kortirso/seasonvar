module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate, only: %i[library]
      before_action :find_active_purchases, only: %i[library]

      resource_description do
        short 'Users information resources'
        formats ['json']
      end

      api :GET, '/v1/users/library.json', 'Returns active library of user'
      example '{"movies":[]}'
      error code: 401, desc: 'Unauthenticated'
      def library
        result = ActiveModelSerializers::SerializableResource.new(@purchases.includes(:purchaseable), root: 'movies', each_serializer: LibrarySerializer).as_json
        render json: result, status: 200
      end

      private

      def find_active_purchases
        @purchases = @user.purchases.where('created_at > ?', DateTime.now - 2.days).order(created_at: :asc)
      end
    end
  end
end
