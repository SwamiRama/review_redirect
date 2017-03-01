module ReviewRedirect
  class Browser
    attr_accessor :url

    def initialise(url)
      this.url = url
    end
  end
end