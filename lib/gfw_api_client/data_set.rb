class DataSet
  def self.find_imazon(data_set, type, params)
  	case type
  	when 'iso'
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{params}")
	when 'wdpa'
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/wdpa/#{params}")
	when 'use'
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/use/#{JSON.parse(params)['type']}/#{JSON.parse(params)['id']}")
	when 'geojson'
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}?type=geojson&geojson=#{CGI::escape(params)}")
	end
  end

  def self.find_umd(data_set, type, params)
  	Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{params}")
  end
end