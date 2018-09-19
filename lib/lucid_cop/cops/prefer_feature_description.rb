require "lucid_cop/cop"

module LucidCop
  class PreferFeatureDescription < Cop
    def check
      features do |file, feature|
        name = feature.key?(:description) ? feature[:description].strip : ''
        next unless name.empty?
        references = [reference(file, feature)]
        add_warning(references, 'ideally features will have descriptions')
      end
    end
  end
end
