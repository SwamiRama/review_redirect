require 'colorize'
require_relative 'browser'
require_relative 'csv'

test_hostname = 'https://rp1-www.racingpost.com'
test_path = '/news/horse-racing/?'
csv_path = 'test.csv'

csv = ReviewRedirect::CSVParser.new(file_path: csv_path)

while csv.end?
  browser = ReviewRedirect::Browser.new(url: csv.original_url)
  if (csv.redirect_url == browser.redirect_url && ( browser.status == 301 || browser.status == 302 ))
    puts 'ok'.green
  else
    puts '>>> WRONG <<<'.red
    puts 'original_url: ' + csv.original_url.to_s 
    puts 'redirect_url: ' + browser.redirect_url.to_s
    puts 'status: ' + browser.status.to_s
    puts 'csv_line: ' + csv.current_line_number.to_s
    puts '>'.red * 7 + '<'.red * 7
  end
  csv.next
end


