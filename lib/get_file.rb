class GetFile
  def initialize(file_name)
    @file_name = file_name
  end

  def as_array
    begin
      Array[*open_file(@file_name).split(/[\n]+/)]
    rescue StandardError => e
      puts "Could not open file '#{@file_name}': #{e}"
    end
  end

private

  def open_file(file_name)
    File.read(file_name)
  end
end
