require 'repository'
require 'data_mapper'

module Arden
  module Repository
    class DataMapper
      def repo
        :default
      end

      def location
        'sqlite::memory:'
      end

      def setup
        ::DataMapper.setup(self.repo, self.location)
        ::DataMapper.finalize
        ::DataMapper.auto_upgrade!
      end
    end
  end
end
