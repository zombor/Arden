module Repository
  def self.add(repos)
    repos.each_pair do |key, value|
      value.setup
      Repository.repositories[key] = value
    end
  end

  def self.for(repo)
    Repository.repositories[repo].class
  end

  protected

  def self.repositories
    @repositories ||= {}
  end
end
