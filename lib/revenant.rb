require_relative "revenant/version"
require_relative "revenant/method_declarations"
require_relative "revenant/method_invocations"
require_relative "revenant/parser"
require_relative "revenant/cli"

module Revenant

  def self.dead_methods(files)
    Revenant::Parser.new(files).revenant_methods.each do |method|
      puts "#{method.name}\t#{method.location}"
    end
  end

end
