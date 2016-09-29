class QueryHtml
  def initialize(document)
    @document = document
  end

  def meta_tag_exists?(name:)
    begin
      !@document.xpath("//meta[@name='#{name}']").empty?
    rescue StandardError => e
      puts "Could not query HTML for '<meta name='#{name}'>': #{e}"
    end
  end
end
