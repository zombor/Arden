require 'spec_helper'
require 'arden/repository'

describe Arden::Repository do
  let(:user_repo) { MockRepository.new }

  before :each do
    Arden::Repository.add(:users => user_repo)
  end

  it 'adds a specific repository' do
    Arden::Repository.instance_variable_get(:@repositories).should == {:users => user_repo}
  end

  it 'retreives a specific repository' do
    Arden::Repository.for(:users).should == user_repo.class
  end

  it 'runs setup on repositories when added' do
    user_repo.should_receive(:setup)
    Arden::Repository.add(:users => user_repo)
  end
end

class MockRepository
  def setup
  end
end
