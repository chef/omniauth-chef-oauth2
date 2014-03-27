# omniauth-chef-oauth2

An [OmniAuth](https://github.com/intridea/omniauth) OAuth2 strategy for Chef.

  * [Documentation](https://github.com/opscode/omniauth-chef-oauth2/wiki)
  * [Source](https://github.com/opscode/omniauth-chef-oauth2)
  * [Issues](https://github.com/opscode/omniauth-chef-oauth2/issues?state=open)

## Usage

First, add it to your Gemfile:

    gem 'omniauth-chef-oauth2'

.. then:

    $ bundle install

To configure omniauth-chef-oauth2 in a Rails application, create an OmniAuth initializer file -- e.g., ``config/initializers/omniauth.rb`` -- then set your application key and secret:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :chef_oauth2, ENV['YOUR_APP_KEY'], ENV['YOUR_APP_SECRET']
    end

Add a couple of handlers to ``routes.rb`` -- one for responding to authentication successes, one for failures:

    YourRailsApp::Application.routes.draw do
      ...
      get '/auth/:provider/callback', to: 'sessions#create'
      get '/auth/failure', to: 'sessions#invalid'
    end

On successful authentication, omniauth-chef-oauth2 will provide you with a Hash (as ``env['omniauth.auth']``) representing the authenticated user:

    class SessionsController < ApplicationController
      def create
        auth_hash = env['omniauth.auth']
        ...
      end

      def invalid
        #
      end
    end

An successful auth_hash should look something like this:

    {
      "provider" => "chef_oauth2",
      "uid" => "abrown",
      "info" => {
        "username" => "abrown",
        "first_name" => "Alton",
        "last_name" => "Brown",
        "email" => "alton@altonbrown.com",
        "public_key" => "-----BEGIN PUBLIC KEY-----..."
      },
      "credentials" => {
        "token" => "d3dbdb57",
        "refresh_token" => "3b508c06",
        "expires_at" => 1395955085,
        "expires" => true
      }
    }

... where ``token`` contains the OAuth 2 access token you'll use to make authenticated API requests by passing a Bearer token in an Authorization header.  For example:

    GET /id/users/me
    Authorization: Bearer d3dbdb57
    Accept: application/json

## Tests

    $ bundle exec rspec

# License

|                      |                                            |
|:---------------------|:-------------------------------------------|
| **Author**           | Christian Nunciato (cnunciato@getchef.com) |
| **Copyright:**       | Copyright (c) 2014 Chef Software, Inc.     |
| **License:**         | Apache License, Version 2.0                |

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
