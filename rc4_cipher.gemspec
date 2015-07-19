Gem::Specification.new do |s|

	s.name = 'rc4_cipher'
	s.required_ruby_version = '>= 2.1.2'
	s.required_ruby_gems_version = '>= 2.2.2'
	s.version = '1.0.0'
	s.date = '2015-07-19'
	s.summary = 'An implementation of the RC4 Cipher'
	s.description = 'A simple implementation of the RC4 Cipher'
	s.authors = ["Cody Deckard"]
	s.email = "cjdeckard@gmail.com"
	s.files = ['lib/rc4_cipher.rb', 'spec']
	s.require_paths = ['lib']
	s.test_files = Dir.glob('spec/*_spec.rb')
	s.license = 'MIT'
	s.add_development_dependency 'rspec', '>= 3.3.2'
end