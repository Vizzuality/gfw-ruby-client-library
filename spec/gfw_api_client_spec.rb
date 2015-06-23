require 'spec_helper'

describe GfwApiClient do
  it 'has a version number' do
    expect(GfwApiClient::VERSION).not_to be nil
  end

  it 'has a base url' do
  	expect(GfwApiClient::DataSet::base_url).not_to be nil
  end

  it 'has a proper type' do
  	expect(GfwApiClient::DataSet::construct_url_root).not_to be nil
  end

  it 'has forest change arguments' do
	  expect(GfwApiClient::DataSet::forest_change).not_to be nil
  end
end
