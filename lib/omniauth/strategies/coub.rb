require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Coub < OmniAuth::Strategies::OAuth2

      option :name, 'coub'

      option :client_options, {
        :site => 'http://coub.com/api/v2',
        :authorize_url => 'http://coub.com/oauth2/authorize',
        :token_url => 'http://coub.com/oauth2/token.json'
      }

      uid { raw_info['id'] }

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access.get("api/v2/users/me").parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'coub', 'Coub'
