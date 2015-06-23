class DataSet

  def self.find_imazon(data_set, iso)
  	Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{iso}")
  end

  def self.find_umd(data_set, iso)
  	Typhoeus.get("http://staging.gfw-apis.appspot.com/forest-change/#{data_set}/admin/#{iso}")
  end
end