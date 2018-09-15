require "term/ansicolor"

module LucidCop
  class Issue
    include Term::ANSIColor

    def initialize(name, references, description = nil)
      @name = name
      @references = references
      @description = description
    end
  end

  class Error < Issue
    def render
      result = red(@name)
      result += " - #{@description}" unless @description.nil?
      result += "\n  " + green(@references.uniq * "\n  ")
      result
    end
  end
end
