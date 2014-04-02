require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class ChefOAuth2 < OmniAuth::Strategies::OAuth2

      option :name, 'chef_oauth2'

      option :client_options, {
        site:           'https://id.opscode.com',
        authorize_url:  '/id/oauth/authorize',
        token_url:      '/id/oauth/token'
      }

      uid do
        raw_info['username']
      end

      info do
        {
          'username'    => raw_info['username'],
          'first_name'  => raw_info['first_name'],
          'last_name'   => raw_info['last_name'],
          'email'       => raw_info['email'],
          'public_key'  => raw_info['public_key']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/id/v1/me').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'chef_oauth2', 'ChefOAuth2'
