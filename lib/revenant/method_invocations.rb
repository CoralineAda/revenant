module Revenant
  class MethodInvocations

    attr_reader :paths_to_files

    def initialize(*paths_to_files)
      @paths_to_files = paths_to_files
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
      self.paths_to_files.flatten.map do |path|
        if File.directory?(path)
          Dir.glob(File.join(path, "**", "*.rb"))
        else
          path
        end
      end.flatten
    end

  end
end