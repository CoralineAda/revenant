require "thor"
require "revenant"

module Revenant

  class CLI < Thor

    desc_text << "Example: revenant dead_methods foo/"

    desc "dead_methods PATH_TO_FILE", desc_text
    def dead_methods(path)
      Revenant.dead_methods(path)
    end

    default_task :dead_methods

  end

end
