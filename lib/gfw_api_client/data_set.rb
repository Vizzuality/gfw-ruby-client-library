class DataSet

  def self.find_set(table_space, concessions=nil, country=nil, region=nil, wdpa_id=nil, use_id=nil, type=nil, period=nil)

    request = case concessions
              when 'iso'
                path =  "http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/admin/#{country}"
                path += "/#{region}" if region
                path += "?period=#{period}" if period

                Typhoeus::Request.new(path, followlocation: true)
              when 'wdpa'
                Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/wdpa/#{wdpa_id}?period=#{period}", followlocation: true)
              when 'use'
                Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/use/#{type}/#{use_id}?period=#{period}", followlocation: true)
              end

    request.on_complete do |response|
      response if response.success?
    end

    request.run

  end

end