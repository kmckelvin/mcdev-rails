require 'spec_helper'

describe Project do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:language) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:github_url) }
end
