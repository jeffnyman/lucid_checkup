require "lucid_cop/config"
require "contexts/file_context"

RSpec.describe LucidCop::Config do
  let(:file) { "default.yml" }
  subject { LucidCop::Config.new(file) }

  it "will provide a default config path" do
    expect(subject.config_path).not_to be nil
  end

  context "an empty config file is present" do
    include_context "a file exists"
    let(:file_content) { '---' }

    it "will not load the empty file" do
      expect(subject.config).to eq ''
    end
  end

  context "a non-YAML config file is present" do
    include_context "a file exists"
    let(:file_content) do
      <<-CONTENT
      testing: [
        'test', {
          meaning_of_life: 42
         }
      ]'
      CONTENT
    end

    it "will load file but fail to parse" do
      expect { subject.load_config }.to raise_error(Psych::SyntaxError)
      expect { subject.config }.to raise_error(Psych::SyntaxError)
    end
  end

  context "a valid YAML file is present" do
    include_context "a file exists"
    let(:file_content) do
      <<-CONTENT
---
:test01: test01
:test02: test02
      CONTENT
    end

    before :each do
      subject.load_config
    end

    it "load the values from the config file" do
      expect(subject.config).to eq(test01: 'test01', test02: 'test02')
    end
  end
end
