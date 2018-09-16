module LucidCop
  module TagCollection
    def collect_tags(element)
      return [] unless element.include? :tags
      element[:tags].map { |tag| tag[:name][1..-1] }
    end
  end
end
