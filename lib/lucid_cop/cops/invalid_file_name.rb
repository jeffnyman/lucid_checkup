require "lucid_cop/cop"

module LucidCop
  class InvalidFileName < Cop
    def check
      files do |file|
        base = File.basename(file)
        next unless base != base.downcase || base =~ /[ -]/
        references = [reference(file)]
        add_error(references, 'Feature files should be snake_cased')
      end
    end
  end
end
