# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jira4r-jh-ruby1.9"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Stuart", "James Hollingworth"]
  s.date = "2011-11-22"
  s.description = "the current version of jira4r is quite old. there is a newer version but there isn't a new gem for it so I am just releasing it"
  s.email = "jamiehollingworth@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.textile",
    "README.txt"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "NOTICE",
    "README.textile",
    "README.txt",
    "Rakefile",
    "VERSION",
    "jira4r-jh-ruby1.9.gemspec",
    "lib/jira4r/.DS_Store",
    "lib/jira4r/jira4r.rb",
    "lib/jira4r/jira_tool.rb",
    "lib/jira4r/v2/.DS_Store",
    "lib/jira4r/v2/JiraSoapServiceDriver.rb",
    "lib/jira4r/v2/jiraService.rb",
    "lib/jira4r/v2/jiraServiceMappingRegistry.rb",
    "lib/jiraService.rb",
    "lib/jiraServiceMappingRegistry.rb",
    "spec/.gitignore",
    "spec/jira4r_spec.rb",
    "spec/spec_helper.rb",
    "wsdl/jirasoapservice-v2.wsdl"
  ]
  s.homepage = "http://xircles.rubyhaus.org/projects/jira4r"
  s.licenses = ["Apache"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Clone of latest source from http://xircles.rubyhaus.org/projects/jira4r"
  s.test_files = [
    "spec/jira4r_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<soap4r-ruby1.9>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rspec>, ["= 2.5.0"])
      s.add_development_dependency(%q<diff-lcs>, ["= 1.1.2"])
      s.add_development_dependency(%q<rake>, ["= 0.8.7"])
      s.add_runtime_dependency(%q<soap4r-ruby1.9>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["> 1.2.3"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
    else
      s.add_dependency(%q<soap4r-ruby1.9>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rspec>, ["= 2.5.0"])
      s.add_dependency(%q<diff-lcs>, ["= 1.1.2"])
      s.add_dependency(%q<rake>, ["= 0.8.7"])
      s.add_dependency(%q<soap4r-ruby1.9>, [">= 0"])
      s.add_dependency(%q<rspec>, ["> 1.2.3"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
    end
  else
    s.add_dependency(%q<soap4r-ruby1.9>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rspec>, ["= 2.5.0"])
    s.add_dependency(%q<diff-lcs>, ["= 1.1.2"])
    s.add_dependency(%q<rake>, ["= 0.8.7"])
    s.add_dependency(%q<soap4r-ruby1.9>, [">= 0"])
    s.add_dependency(%q<rspec>, ["> 1.2.3"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
  end
end

