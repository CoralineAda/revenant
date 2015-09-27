module Revenant
  class MethodInvocations

    attr_reader :files

    def initialize(*files)
      @files = files
    end

    def all
      file_paths.map do |path|
        File.open(path) do |file|
          calls_from(file.read)
        end
      end.flatten
    end

    private

    def calls_from(source)
      source.scan(/(?<!def self)[:\.]([a-z\_]+)/).flatten
    end

    def file_paths
      files.map do |path|
        if File.directory?(path)
          Dir.glob(File.join(path, "**", "*.rb"))
        else
          path
        end
      end.flatten
    end

  end
end