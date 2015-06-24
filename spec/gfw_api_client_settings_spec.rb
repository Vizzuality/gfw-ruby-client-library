require 'spec_helper'

describe 'GfwApiClient Settings' do

	it 'has a version number' do
    expect(GfwApiClient::VERSION).not_to be nil
  end

end