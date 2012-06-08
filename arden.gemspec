lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'arden/version'

Gem::Specification.new do |s|
  s.name = 'arden'
  s.version = Arden::VERSION
  s.authors = ['Jeremy Bush']
  s.email = ['contractfrombelow@gmail.com']
  s.summary = 'Repository pattern library for ruby'

  s.add_dependency('datamapper', '1.2.0')
  s.add_dependency('dm-sqlite-adapter', '1.2.0')

  s.files = Dir['lib/**/*.rb']
  s.files.reject! { |fn| fn.include? 'version.rb' }
  s.require_path = 'lib'
end
