module Api
  module V1
    class BaseController < ApplicationController
      class AuthFailure < StandardError; end

      protect_from_forgery with: :null_session

      private

      def authenticate
        find_token
        check_token
        find_user
      rescue AuthFailure => ex
        render json: { errors: ex.message }, status: 401
      end

      def find_token
        @token = request.headers['Authorization']
        raise AuthFailure, 'There is no authorization token in headers' if @token.nil?
      end

      def check_token
        @identifier = JwtService.new.decode(token: @token)['user_id']
      rescue
        raise AuthFailure, 'Signature verification error'
      end

      def find_user
        @user = User.find_by(id: @identifier)
        raise AuthFailure, 'Authorization error' if @user.nil?
      end
    end
  end
end
