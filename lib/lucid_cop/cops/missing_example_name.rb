require "lucid_cop/cop"

module LucidCop
  class MissingExampleName < Cop
    def check
      scenarios do |file, feature, scenario|
        next unless scenario.key? :examples
        next unless scenario[:examples].length > 1

        scenario[:examples].each do |example|
          name = example.key?(:name) ? example[:name].strip : ''
          next unless name.empty?
          references = [reference(file, feature, scenario)]
          add_error(references, 'the example section provided has no name')
        end
      end
    end
  end
end
