require "lucid_cop"
require "contexts/file_context"

RSpec.describe LucidCop::LucidCop do
  it "will have a COP constant for all defined cops" do
    expect(LucidCop::LucidCop.const_defined?(:COP)).to be true
  end

  subject { LucidCop::LucidCop.new }

  describe "#initialize" do
    it "will set the files instance variable to empty" do
      expect(subject.instance_variable_get(:@files)).to eq({})
    end

    it "will set the cop instance variable to empty" do
      expect(subject.instance_variable_get(:@cop).size).to eq(0)
    end
  end

  describe "#enable" do
    it "enables the cop passed in" do
      subject.enable ["AvoidPunctuation"]
      expect(subject.instance_variable_get(:@config).config).to include(
        'AvoidPunctuation' => { 'Enabled' => true }
      )
    end
  end

  context "user configuration is not present" do
    let(:file) { 'config/default.yml' }

    it "will load the expected values from the config file" do
      expect(subject.instance_variable_get(:@config).config).to include(
        'AvoidPunctuation' => { 'Enabled' => true }
      )
    end
  end

  context "user provided YAML is present" do
    include_context "a file exists"
    let(:file) { '.lucidcop.yml' }
    let(:file_content) do
      <<-CONTENT
---
AvoidDumbStuff:
    Enabled: false
      CONTENT
    end
    it "will load and merge the expected values from the user config file" do
      expect(subject.instance_variable_get(:@config).config).to include(
        'AvoidDumbStuff' => { 'Enabled' => false }
      )
    end
  end
end
