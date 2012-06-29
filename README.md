# Arden

Arden is a repository pattern library for ruby. It lets you separate your domain logic and your persistance logic.

You can use the raw driver models if you'd like (DataMapper, etc), but I'd recommend that you use generic ruby objects for your domain models.

It currently only has a DataMapper adapter.

## Usage

Create a repository:

```ruby
require 'arden'

class User
  attr_accessor :id, :email, :password
end

module Repository
  class User < Arden::Repository::DataMapper

    # data is a pre-built domain object (a generic user class)
    def self.create(data)
      user = User.new(:email => data.email, :password => data.password)
      user.save
    end

    # returns a loaded domain object (a generic user class)
    def self.find_by_id(id)
      self.assign_user(User.get(id))
    end

    def self.assign_user(source)
      user = new User
      user.id = source.id
      user.email = source.email
      user.password = source.password
      user
    end

    class User
      include ::DataMapper::Resource

      property :id,       Serial
      property :email,    String
      property :password, String
    end
  end
end
```

Add this repository:

```ruby
Arden::Repository.add(:user => Repository::User.new)
```

Use it:

```ruby
user = Arden::Repository.for(:user).find_by_id(1)
```
