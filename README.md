# GOV.UK HTML Crawler

This app crawls GOV.UK to retrieve details of HTML tag usage.
For example, it can tell you which pages have a meta description tag and which
ones do not.

## Technical documentation

This is a Ruby app that uses Nokogiri to parse the HTML of crawled pages.
At the moment, it takes a list of pages to look at which means it's not a real
crawler in the purest sense of the term.

## Running the application

### Meta description tags

`bundle exec rake crawl:meta_descriptions['app/content/sample_base_paths.txt','staging']`

`sample_base_paths.txt` should be a text file with one base path per line
(see app/content/sample_base_paths.txt for an example)

`staging` should be a valid GOV.UK environment (production, staging or integration)

## Licence

[MIT License](LICENCE.txt)
