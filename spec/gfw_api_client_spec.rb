require 'spec_helper'

describe 'GfwApiClient data sets' do
  %w(imazon-alerts
       umd-loss-gain
       forma-alerts
       nasa-active-fires
       quicc-alerts
       terrai-alerts
    ).each do |table_space|

    describe "get #{table_space} data" do

      it "returns a json with data for #{table_space} wdpa" do
      	@options = {}
  	  	@options['table_space'] = "#{table_space}"
        @options['concessions'] = 'wdpa'
        @options['wdpa_id'] = '352219'
        @options['start_date'] = '2014-01-01'
        @options['end_date'] = '2015-01-01'

      	@data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be == '2014-01-01'
        expect(@data_table_body['params']['end']).to be == '2015-01-01'
      end

      it "returns a json with data for #{table_space} iso" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'iso'
        @options['country'] = 'BRA'
        @options['region'] = '3'
        @options['start_date'] = '2014-01-01'
        @options['end_date'] = '2015-01-01'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be == '2014-01-01'
        expect(@data_table_body['params']['end']).to be == '2015-01-01'
      end

      it "returns a json with data for #{table_space} use" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'use'
        @options['use_id'] = '5602'
        @options['type'] = 'mining'
        @options['start_date'] = '2014-01-01'
        @options['end_date'] = '2015-01-01'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be == '2014-01-01'
        expect(@data_table_body['params']['end']).to be == '2015-01-01'
      end

      it "returns a json with data for #{table_space} geojson" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'geojson'
        @options['geo_json'] = '{"type":"Polygon","coordinates":[[[-63.8333,-12.3427],[-63.6218,-12.2407],[-63.6465,-12.4446],[-63.8333,-12.3427]]]}'
        @options['start_date'] = '2008-01-01'
        @options['end_date'] = '2014-01-01'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be == '2008-01-01'
        expect(@data_table_body['params']['end']).to be == '2014-01-01'
      end

      it "returns a json with data for #{table_space} iso if not all params present" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'iso'
        @options['country'] = 'BRA'
        @options['start_date'] = '2014-01-01'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be_nil
        expect(@data_table_body['params']['end']).to be_nil
      end

      it "returns a json with data for #{table_space} wdpa if not all params present" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'wdpa'
        @options['wdpa_id'] = '352219'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
      end

      it "returns a json with data for #{table_space} use if not all params present" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'use'
        @options['use_id'] = '5602'
        @options['type'] = 'mining'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
      end

      it "returns a json with data for #{table_space} geojson if not all params present" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'geojson'
        @options['geo_json'] = '{"type":"Polygon","coordinates":[[[-63.8333,-12.3427],[-63.6218,-12.2407],[-63.6465,-12.4446],[-63.8333,-12.3427]]]}'
        @options['start_date'] = '2001-01-01' if table_space == 'umd-loss-gain' #date should be present for umd-loss-gain table_space
        @options['end_date'] = '2015-01-01' if table_space == 'umd-loss-gain' #date should be present for umd-loss-gain table_space

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be_nil unless table_space == 'umd-loss-gain'
        expect(@data_table_body['params']['end']).to be_nil unless table_space == 'umd-loss-gain'
      end

      it "returns a json with data for #{table_space} iso and api_url param" do
        @options = {}
        @options['table_space'] = "#{table_space}"
        @options['concessions'] = 'iso'
        @options['country'] = 'BRA'
        @options['region'] = '3'
        @options['start_date'] = '2014-01-01'
        @options['end_date'] = '2015-01-01'
        @options['api_url'] = 'http://staging.gfw-apis.appspot.com'

        @data_table      = GfwApiClient.find_set(@options)
        @data_table_body = JSON.parse(@data_table.body)

        expect(@data_table.code).to eq(200)
        expect(@data_table_body['meta']['id']).to be == table_space
        expect(@data_table_body['params']['begin']).to be == '2014-01-01'
        expect(@data_table_body['params']['end']).to be == '2015-01-01'
      end

    end
  end

end
