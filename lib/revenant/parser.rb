module Revenant
  class Parser

    attr_reader :files

    def initialize(files)
      @files = files
    end

    def revenant_methods
      defined_methods.reject do |method|
        method.name == "initialize" || called_methods.include?(method.name)
      end
    end

    private

    def defined_methods
      Revenant::MethodDeclarations.new(self.files).all
    end

    def called_methods
      Revenant::MethodInvocations.new(self.files).all
    end

  end
end