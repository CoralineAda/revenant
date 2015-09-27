require 'analyst'

module Revenant
  class MethodDeclarations

    attr_reader :files

    def initialize(files)
      @files = files
    end

    def all
      methods_from_classes + methods_from_modules
    end

    private

    def methods_from_classes
      return [] unless parsed_files.classes.any?
      parsed_files.classes.map(&:all_methods).flatten
    end

    def methods_from_modules
      return [] unless parsed_files.modules.any?
      parsed_files.modules.map(&:all_methods).flatten
    end

    def parsed_files
      @parsed_files ||= Analyst.for_files(self.files)
    end

  end
end