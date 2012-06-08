require 'repository/datamapper'

module Repository
  class User < Repository::DataMapper

    def self.create(user)
      t_user = User.new(:email => user.email, :password => user.password)
      t_user.save
      puts t_user.id
    end

    def self.find_by_id(id)
      User.get(id)
    end

    def self.all
      User.all
    end

    class User
      include ::DataMapper::Resource

      property :id,       Serial
      property :email,    String
      property :password, String
    end

  end
end
