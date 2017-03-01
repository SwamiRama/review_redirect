require_relative 'browser'
test_hostname = 'https://rp1-www.racingpost.com'
test_path = '/news/horse-racing/?'

rr = ReviewRedirect::Browser.new(hostname: test_hostname, path: test_path)

require 'pry'; binding.pry


