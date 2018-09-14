require "yaml"

module LucidCop
  class Config
    attr_reader :config

    def initialize(path)
      @path = path
      @config = load_config || ''
      load_user_config
    end

    def config_path
      @path
    end

    def load_config
      YAML.load_file(config_path || '') if File.exist?(config_path)
    end

    def load_user_config
      user_file = Dir.glob(File.join(Dir.pwd, '**', '.lucidcop.yml')).first
      merge_config(user_file) if !user_file.nil? && File.exist?(user_file)
    end

    private

    def merge_config(config_file)
      return if @config.empty?
      @config.merge!(YAML.load_file(config_file)) do |_k, old, new|
        old.merge!(new)
      end
    end
  end
end
