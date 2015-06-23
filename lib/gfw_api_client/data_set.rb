class DataSet

  def self.find_imazon(data_set, type, params)
  	case type
  	when 'iso'
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{params}")
	when 'wdpa'
		puts params
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/wdpa/#{params}")
	when 'use'
		puts params
		Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/use/#{JSON.parse(params)['type']}/#{JSON.parse(params)['id']}")
	end
  end

  def self.find_umd(data_set, type, params)
  	Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{params}")
  end
end