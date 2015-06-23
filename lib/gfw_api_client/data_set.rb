module GfwApiClient
	class DataSet
	    def forest_change type, data_set, params=nil, *path_args
	      url = construct_url_root(type,data_set)
	      url += "/#{path_args.join('/')}"
	      url += "?#{params.to_query}"
	      self.response = Typhoeus.get(url, followlocation: true)
	    end
		private
		    def construct_url_root type, data_set
		      if type.to_sym == :iso
		        "#{base_url}/forest-change/#{table_name(data_set)}/admin"
		      elsif type.to_sym == :ifl
		        "#{base_url}/forest-change/#{table_name(data_set)}/admin/#{type.to_s}"
		      elsif type.to_sym == :wdpa || type.to_sym == :use
		        "#{base_url}/forest-change/#{table_name(data_set)}/#{type.to_s}"
		      end
		    end
		    def base_url
		      @base_url ||= GfwApiClient.config['base_url']
		    end
		end
	end
end