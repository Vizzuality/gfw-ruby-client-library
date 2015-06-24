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
      end

    end
  end

end
