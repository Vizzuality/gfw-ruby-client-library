require 'typhoeus'

require 'gfw_api_client/version'
require 'gfw_api_client/data_set'

module GfwApiClient

  def self.find_set(options)

    table_space = options['table_space'] if options['table_space']
    concessions = options['concessions'] if options['concessions']
    country     = options['country']     if options['country']
    region      = options['region']      if options['region']
    start_date  = options['start_date']  if options['start_date']
    end_date    = options['end_date']    if options['end_date']
    date        = options['date']        if options['date']
    wdpa_id     = options['wdpa_id']     if options['wdpa_id']
    use_id      = options['use_id']      if options['use_id']
    type        = options['type']        if options['type']
    geojson     = options['geo_json']    if options['geo_json']

    period = if (start_date && end_date)
               start_date + ',' + end_date
             end

    DataSet.find_set(table_space, concessions, country, region, wdpa_id, use_id, type, period, geojson) if table_space

  end

end