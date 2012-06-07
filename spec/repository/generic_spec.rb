require 'spec_helper'
require 'repository'

describe Repository do
  let(:user_repo) { MockRepository.new }

  before :each do
    Repository.add(:users => user_repo)
  end

  it 'adds a specific repository' do
    Repository.instance_variable_get(:@repositories).should == {:users => user_repo}
  end

  it 'retreives a specific repository' do
    Repository.for(:users).should == user_repo
  end

  it 'runs setup on repositories when added' do
    user_repo.should_receive(:setup)
    Repository.add(:users => user_repo)
  end
end

class MockRepository
  def setup
  end
end
