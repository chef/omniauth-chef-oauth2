# encoding: utf-8
require 'spec_helper'

describe OmniAuth::Strategies::ChefOAuth2 do

  subject do
    OmniAuth::Strategies::ChefOAuth2.new(nil, @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) { @request }
    end
  end

  it 'should camelize properly' do
    expect(OmniAuth::Utils.camelize('chef_oauth2')).to eq('ChefOAuth2')
  end

  it 'should have the correct default site' do
    expect(subject.options.client_options.site).to eq("https://id.chef.io")
  end

  it 'should have the correct default authorize url' do
    expect(subject.options.client_options.authorize_url).to eq('/id/oauth/authorize')
  end

  it 'should have the correct default token url' do
    expect(subject.options.client_options.token_url).to eq('/id/oauth/token')
  end

  it_should_behave_like 'an oauth2 strategy'

end
