require 'spec_helper'
require 'arden/repository/datamapper'

describe Arden::Repository::DataMapper do
  it 'sets a datamapper repository' do
    DataMapper.should_receive(:setup).with(:default, 'sqlite::memory:')
    DataMapper.should_receive(:finalize)
    DataMapper.should_receive(:auto_upgrade!)
    Arden::Repository::DataMapper.new.setup
  end
end
