class DataSet

  def self.find_set(table_space, concessions=nil, country=nil, region=nil, wdpa_id=nil, use_id=nil, type=nil, period=nil, geojson=nil)

    base_url = "http://staging.gfw-apis.appspot.com/forest-change/#{table_space}"

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