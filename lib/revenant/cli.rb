require "thor"
require "revenant"

module Revenant

  class CLI < Thor

    desc "dead_methods PATH_TO_FILEs", "Example: revenant dead_methods foo/"
    def dead_methods(path, *more_paths)
      paths = [path] + more_paths
      Revenant.dead_methods(paths)
    end

    default_task :dead_methods

  end

end
