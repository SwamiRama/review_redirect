require 'http'
module ReviewRedirect
  class Browser
    attr_reader :redirect_url, :url, :hostname, :path, :call_url

    def initialize(args)
      @url = args[:hostname].to_s + args[:path].to_s if args[:url].nil?
      @url = args[:url].to_s
    end

    def original_url
      url
    end

    def redirect_url
      call_url[:Location]
    end

    def status
      call_url.status
    end

    def call_url
      @call_url ||= HTTP.get(url)
    end
  end
end