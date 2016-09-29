require 'nokogiri'
require 'open-uri'

class GetUrl
  def initialize(base_path, environment)
    @url = make_url(base_path, environment)
  end

  def parse_html
    begin
      Nokogiri::HTML(open(@url)) do |config|
        # Ignore any HTML parsing errors, and don't connect to the web to
        # download files referenced on the page
        config.noerror.nonet
      end
    rescue StandardError => e
      puts "Could not open URL '#{@url}': #{e}"
    end
  end

private

  def get_url_prefix(environment)
    # Always default to "staging"
    case environment
    when 'integration'
      'https://www-origin.integration.publishing.service.gov.uk'
    when 'production'
      'https://www.gov.uk'
    else
      'https://www-origin.staging.publishing.service.gov.uk'
    end
  end

  def make_url(base_path, environment)
    prefix = get_url_prefix(environment)
    # Add a slash between the prefix and base_path if required
    if base_path[0] == '/'
      "#{prefix}#{base_path}"
    else
      "#{prefix}/#{base_path}"
    end
  end
end
