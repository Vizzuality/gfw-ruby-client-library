require 'spec_helper'

describe GfwApiClient do

  it 'has a version number' do
    expect(GfwApiClient::VERSION).not_to be nil
  end

  describe 'get imazon-alerts data' do

    it 'returns a json with data for imazon-alerts wdpa' do
    	@options = {}
	  	@options['table_space'] = 'imazon-alerts'
      @options['concessions'] = 'wdpa'
      @options['wdpa_id'] = '352219'
      @options['start_date'] = '2014-01-01'
      @options['end_date'] = '2015-01-01'

    	@imazon_iso = GfwApiClient.find_set(@options)
      @imazon_iso = JSON.parse(@imazon_iso)
      expect(@imazon_iso['value'][0]['data_type']).to be == 'degrad'
      expect(@imazon_iso['value'][0]['value']).to be == 0
    end

    it 'returns a json with data for imazon-alerts iso' do
      @options = {}
      @options['table_space'] = 'imazon-alerts'
      @options['concessions'] = 'iso'
      @options['country'] = 'BRA'
      @options['region'] = '3'
      @options['start_date'] = '2014-01-01'
      @options['end_date'] = '2015-01-01'

      @imazon_iso = GfwApiClient.find_set(@options)
      @imazon_iso = JSON.parse(@imazon_iso)
      expect(@imazon_iso['value'][0]['data_type']).to be == 'degrad'
      expect(@imazon_iso['value'][0]['value']).to be == 212.05841165708
      expect(@imazon_iso['value'][1]['data_type']).to be == 'defor'
      expect(@imazon_iso['value'][1]['value']).to be == 491.900551782574
    end

    it 'returns a json with data for imazon-alerts iso if not all params present' do
      @options = {}
      @options['table_space'] = 'imazon-alerts'
      @options['concessions'] = 'iso'
      @options['country'] = 'BRA'
      @options['start_date'] = '2014-01-01'

      @imazon_iso = GfwApiClient.find_set(@options)
      @imazon_iso = JSON.parse(@imazon_iso)
      expect(@imazon_iso['value'][0]['data_type']).to be == 'degrad'
      expect(@imazon_iso['value'][0]['value']).to be == 263622.30134866
      expect(@imazon_iso['value'][1]['data_type']).to be == 'defor'
      expect(@imazon_iso['value'][1]['value']).to be == 336735.431496333
    end

    it 'returns a json with data for imazon-alerts use' do
      @options = {}
      @options['table_space'] = 'imazon-alerts'
      @options['concessions'] = 'use'
      @options['use_id'] = '5602'
      @options['type'] = 'mining'
      @options['start_date'] = '2014-01-01'
      @options['end_date'] = '2015-01-01'

      @imazon_iso = GfwApiClient.find_set(@options)
      @imazon_iso = JSON.parse(@imazon_iso)
      expect(@imazon_iso['value'][0]['data_type']).to be == 'degrad'
      expect(@imazon_iso['value'][0]['value']).to be == 0
      expect(@imazon_iso['value'][1]['data_type']).to be == 'defor'
      expect(@imazon_iso['value'][1]['value']).to be == 0
    end
  end

end
