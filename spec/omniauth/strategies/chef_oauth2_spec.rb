# encoding: utf-8
require 'spec_helper'

describe OmniAuth::Strategies::ChefOAuth2 do

  subject do
    OmniAuth::Strategies::ChefOAuth2.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  it 'should camelize properly' do
    OmniAuth::Utils.camelize('chef_oauth2').should eq('ChefOAuth2')
  end

  it 'should have the correct default site' do
    subject.options.client_options.site.should eq("https://api.opscode.com")
  end

  it 'should have the correct default authorize url' do
    subject.options.client_options.authorize_url.should eq('/oauth/authorize')
  end

  it 'should have the correct default token url' do
    subject.options.client_options.token_url.should eq('/oauth/token')
  end

  it_should_behave_like 'an oauth2 strategy'

end
