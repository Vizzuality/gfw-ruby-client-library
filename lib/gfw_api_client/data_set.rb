class DataSet

  def self.find_set(table_space, concessions=nil, country=nil, region=nil, wdpa_id=nil, use_id=nil, type=nil, period=nil, geojson=nil, api_url=nil)

    if api_url
      # Get client credentials for GFW API from params
      gfw_api_url = api_url
    else
      # Get client credentials for GFW API from YML file
      gfw_api_url = if defined?(Rails)
                      gfw_config = YAML.load(File.read(File.expand_path('config/gfw.yml', Rails.root)))[Rails.env]
                      gfw_config['gfw_api_url']
                    else
                      'http://staging.gfw-apis.appspot.com'
                    end
    end

    base_url = "#{gfw_api_url}/forest-change/#{table_space}"

    request = case concessions
              when 'iso'
                path =  "#{base_url}/admin/#{country}"
                path += "/#{region}" if region
                path += "?period=#{period}" if period

                Typhoeus::Request.new(path, followlocation: true)
              when 'wdpa'
                path =  "#{base_url}/wdpa/#{wdpa_id}"
                path += "?period=#{period}" if period

                Typhoeus::Request.new(path, followlocation: true)
              when 'use'
                path =  "#{base_url}/use/#{type}/#{use_id}"
                path += "?period=#{period}" if period

                Typhoeus::Request.new(path, followlocation: true)
      			  when 'geojson'
                path =  "#{base_url}?type=geojson&geojson=#{CGI::escape(geojson)}"
                path += "&period=#{period}" if period

                Typhoeus::Request.new(path, followlocation: true)
              end

    request.on_complete do |response|
      response if response.success?
    end

    request.run

  end

end