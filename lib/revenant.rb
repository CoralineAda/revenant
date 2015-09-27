require_relative "revenant/version"
require_relative "revenant/method_declarations"
require_relative "revenant/method_invocations"
require_relative "revenant/parser"
require_relative "revenant/cli"
require 'terminal-table'

module Revenant

  def self.dead_methods(paths_to_files)
    rows = []
    dead_methods = Revenant::Parser.new(paths_to_files).revenant_methods
    puts "\n#{dead_methods.size} Dead Methods Found"
    dead_methods.each do |method|
      rows << [method.name, method.location]
    end
    puts Terminal::Table.new :rows => rows
  end

end
