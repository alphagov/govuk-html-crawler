require_relative 'lib/get_file'
require_relative 'lib/get_url'
require_relative 'lib/query_html'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
end

task default: [:spec]

task :environment

namespace :crawl do
  task :meta_descriptions, [:file_name, :site_environment] => :environment do |_, args|
    site_environment = args[:site_environment] || 'staging'
    base_paths = GetFile.new(args[:file_name]).as_array
    if base_paths.is_a?(Array)
      base_paths.each do |base_path|
        puts "Getting HTML for '#{base_path}' in #{site_environment}"
        document = GetUrl.new(base_path, site_environment).parse_html
        if document.is_a?(Nokogiri::HTML::Document)
          tag_exists = QueryHtml.new(document).meta_tag_exists?(name: 'description')

          if tag_exists
            puts "✔ #{base_path} has a meta description tag"
          else
            puts "✘ #{base_path} does not have a meta description tag"
          end
        end
        puts
      end
    end
  end
end

task :lint do
  sh "bundle exec govuk-lint-ruby"
end
