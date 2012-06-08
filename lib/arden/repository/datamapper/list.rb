require 'repository/datamapper'

module Repository
  class List < Repository::DataMapper

    def self.create(list)
      list = List.new(:title => list.title)
      list.save
    end

    def self.find_by_id(id)
      List.get(id)
    end

    def self.all
      List.all
    end

    class List
      include ::DataMapper::Resource

      property :id,       Serial
      property :title,    String
    end

  end
end
