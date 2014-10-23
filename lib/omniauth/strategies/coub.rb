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
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :access_token
        @raw_info ||= access_token.get('/1/user.json').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'coub', 'Coub'
