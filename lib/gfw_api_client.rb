require "gfw_api_client/version"

module GfwApiClient
    class API
    attr_accessor  :response

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

    def table_name data_set
      if data_set.to_sym == :umd
        'umd-loss-gain'
      elsif data_set.to_sym == :forma
        'forma-alerts'
      elsif data_set.to_sym == :terrai
        'terrai-alerts'
      elsif data_set.to_sym == :fires
        'nasa-active-fires'
      elsif data_set.to_sym == :imazon
        'imazon-alerts'
      elsif data_set.to_sym == :quicc
        'quicc-alerts'
      end
    end

    def base_url
      @base_url ||= GFW.config['base_url']
    end
  end
end
