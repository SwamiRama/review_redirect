require 'csv'
module ReviewRedirect
  class CSVParser
    attr_accessor :file_path, :csv_row_number
    attr_reader :csv_content

    def initialize(args)
      @file_path = args[:file_path]
      @csv_row_number = 0
    end

    def original_url
      fetch_line[@csv_row_number][:original_domain] + fetch_line[@csv_row_number][:original_path]
    end

    def redirect_url
      fetch_line[@csv_row_number][:redirect_domain] + fetch_line[@csv_row_number][:redirect_path]
    end

    def fetch_line
      @csv_content ||= CSV.read(file_path, {headers: true,  header_converters: :symbol})
    end

    def next
      @csv_row_number += 1
      current_line_number
    end

    def preview
      @csv_row_number -= 1
      current_line_number
    end

    def current_line_number
      @csv_row_number + 1
    end

    def count_line_numbers
      fetch_line.count
    end

    def end?
      fetch_line.count > @csv_row_number
    end
  end    
end
