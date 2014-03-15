# encoding: utf-8
require 'spec_helper'

describe OmniAuth::Strategies::ChefOAuth2 do
  subject { OmniAuth::Strategies::ChefOAuth2.new(nil) }

  it 'should camelize properly' do
    expect(OmniAuth::Utils.camelize('chef_oauth2')).to eq('ChefOAuth2')
  end

end
