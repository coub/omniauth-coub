require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Coub < OmniAuth::Strategies::OAuth2
      COUB_HOST = ENV['OA_COUB_HOST'] || "coub.com"

      option :name, 'coub'
      option :client_options, {
        :site => "http://#{COUB_HOST}/api/v2",
        :authorize_url => "http://#{COUB_HOST}/oauth/authorize",
        :token_url => "http://#{COUB_HOST}/oauth/token.json"
      }

      uid { raw_info['id'] }

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access.get("sers/me").parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'coub', 'Coub'
