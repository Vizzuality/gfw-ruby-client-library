require 'typhoeus'

require 'gfw_api_client/version'
require 'gfw_api_client/data_set'

module GfwApiClient

  def self.find_set(data_set, iso)
    DataSet.find_imazon(data_set, iso)
  end

end