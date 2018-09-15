require "lucid_cop/cop"

module LucidCop
  class MissingFeatureDescription < Cop
    def check
      features do |file, feature|
        name = feature.key?(:description) ? feature[:description].strip : ''
        next unless name.empty?
        references = [reference(file, feature)]
        add_warning(references, 'Ideally have a user story as description')
      end
    end
  end
end
