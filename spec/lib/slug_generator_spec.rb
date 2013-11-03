require 'spec_helper'

describe SlugGenerator do
  def generator
    SlugGenerator.new
  end

  describe "#generate" do
    it "parameterizes normal strings" do
      slug = generator.generate("A test string")
      expect(slug).to eq "a-test-string"
    end

    it "converts '.' to 'dot'" do
      slug = generator.generate("Ruby 1.9")
      expect(slug).to eq "ruby-1-dot-9"
    end
  end
end
