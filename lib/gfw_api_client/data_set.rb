class DataSet
  def self.find_imazon(table_space, concessions=nil, country=nil, region=nil, wdpa_id=nil, use_id=nil, type=nil, period=nil, geojson=nil)
  	unless period.nil? || period == 0
  		period = 'period='+period
  	end
  	request = case concessions
			  when 'iso'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/admin/#{country}/#{region}?#{period}", followlocation: true)
				when 'wdpa'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/wdpa/#{wdpa_id}?#{period}", followlocation: true)
				when 'use'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/use/#{type}/#{use_id}?#{period}", followlocation: true)
				when 'geojson'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}?type=geojson&geojson=#{CGI::escape(geojson)}&#{period}", followlocation: true)
				end

		request.on_complete do |response|
		  if response.success?
		    response
		  elsif response.timed_out?
		    raise "got a time out"
		  elsif response.code == 0
		    raise response.return_message
		  else
		    raise "HTTP request failed: " + response.code.to_s
		  end
		end

		request.run.body
  end
  def self.find_umd(table_space, concessions=nil, country=nil, region=nil, wdpa_id=nil, use_id=nil, type=nil, period=nil, geojson=nil)
  	unless period.nil? || period == 0
  		period = 'period='+period
  	end
  	request = case concessions
			  when 'iso'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/admin/#{country}/#{region}?#{period}", followlocation: true)
				when 'wdpa'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/wdpa/#{wdpa_id}?#{period}", followlocation: true)
				when 'use'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}/use/#{type}/#{use_id}?#{period}", followlocation: true)
				when 'geojson'
					Typhoeus::Request.new("http://staging.gfw-apis.appspot.com/forest-change/#{table_space}?type=geojson&geojson=#{CGI::escape(geojson)}&#{period}", followlocation: true)
				end

		request.on_complete do |response|
		  if response.success?
		    response
		  elsif response.timed_out?
		    raise "got a time out"
		  elsif response.code == 0
		    raise response.return_message
		  else
		    raise "HTTP request failed: " + response.code.to_s
		  end
		end

		request.run.body
  end
end