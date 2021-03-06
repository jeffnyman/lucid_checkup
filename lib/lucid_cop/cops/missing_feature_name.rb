require "lucid_cop/cop"

module LucidCop
  class MissingFeatureName < Cop
    def check
      features do |file, feature|
        name = feature.key?(:name) ? feature[:name].strip : ''
        next unless name.empty?
        references = [reference(file, feature)]
        add_error(references, 'no feature name is provided')
      end
    end
  end
end
