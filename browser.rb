require 'http'
module ReviewRedirect
  class Browser
    attr_accessor :hostname, :path, :call_url
    attr_reader :redirect_url

    def initialize(args)
      @hostname = args[:hostname].to_s
      @path = args[:path].to_s
    end

    def original_url
      hostname + path
    end

    def redirect_url
      call_url[:Location]
    end

    def status
      call_url.status
    end

    def call_url
      @call_url ||= HTTP.get(hostname + path)
    end
  end
end