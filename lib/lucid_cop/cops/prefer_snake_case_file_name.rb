require "lucid_cop/cop"

module LucidCop
  class PreferSnakeCaseFileName < Cop
    def check
      files do |file|
        base = File.basename(file)
        next unless base != base.downcase || base =~ /[ -]/
        references = [reference(file)]
        add_warning(references, 'feature files should be snake_cased')
      end
    end
  end
end
