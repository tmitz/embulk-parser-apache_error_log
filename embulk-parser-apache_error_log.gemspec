
Gem::Specification.new do |spec|
  spec.name          = "embulk-parser-apache_error_log"
  spec.version       = "0.1.1"
  spec.authors       = ["Tomohiro Mitsusmune"]
  spec.summary       = "Apache Error Log parser plugin for Embulk"
  spec.description   = "Parses Apache Error Log files read by other file input plugins."
  spec.email         = ["tmitsumune@gmail.com"]
  spec.licenses      = ["MIT"]
  spec.homepage      = "https://github.com/tmitz/embulk-parser-apache_error_log"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency 'YOUR_GEM_DEPENDENCY', ['~> YOUR_GEM_DEPENDENCY_VERSION']
  spec.add_development_dependency 'embulk', ['>= 0.8.15']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
end
