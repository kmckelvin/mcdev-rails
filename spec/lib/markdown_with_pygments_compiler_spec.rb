require 'spec_helper'

describe MarkdownWithPygmentsCompiler do
  describe "#compile" do
    context "with valid markdown with a code block" do
      it "renders syntax highlighted code" do
        markdown_sample = <<EOS
``` ruby
def hello(args)
end
```
EOS
        markup = MarkdownWithPygmentsCompiler.new.compile(markdown_sample)
        expect(markup).to include "highlight"
      end
    end
  end
end
