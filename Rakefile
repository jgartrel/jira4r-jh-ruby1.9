require 'net/http'
require 'fileutils'
require 'rake/clean'
require 'logger'

begin
  require 'rubygems'
  require 'bundler'
  require 'rake/gempackagetask'
rescue Exception
  nil
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "jira4r-jh-ruby1.9"
  gem.homepage = "http://xircles.rubyhaus.org/projects/jira4r"
  gem.license = "Apache"
  gem.summary = %Q{Clone of latest source from http://xircles.rubyhaus.org/projects/jira4r }
  gem.description = %Q{the current version of jira4r is quite old. there is a newer version but there isn't a new gem for it so I am just releasing it}
  gem.email = "jamiehollingworth@gmail.com"
  gem.authors = ["James Stuart", "James Hollingworth"]

  gem.add_runtime_dependency 'soap4r-ruby1.9'
  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_development_dependency 'jeweler'
  gem.add_development_dependency 'bundler'
end
Jeweler::RubygemsDotOrgTasks.new


gem 'soap4r-ruby1.9'

require 'wsdl/soap/wsdl2ruby'

logger = Logger.new(STDERR)
logger.level = Logger::INFO


desc "gets the wsdl and generates the classes"
task :default => [:generate]


desc "gets the wsdl files for JIRA services"
task :getwsdl do
  versions().each { |version| 
    save(getWsdlFileName(version), get_file("jira.codehaus.org", "/rpc/soap/jirasoapservice-v#{version}?wsdl"))
  }
end

task :clean do
  def unl(file)
    File.unlink(file) if File.exist?(file)
  end
  unl("wsdl/jirasoapservice-v2.wsdl")
  unl("lib/jira4r/v2/jiraService.rb")
  unl("lib/jira4r/v2/jiraServiceDriver.rb")
  unl("lib/jira4r/v2/jiraServiceMappingRegistry.rb")
end

desc "generate the wsdl"
task :generate do
  versions().each { |version|
    wsdl = getWsdlFileName(version)
    basedir = "lib/jira4r/v#{version}"
    mkdir_p basedir

    if not File.exist?(wsdl)
      raise "WSDL does not exist: #{wsdl}"
    end
    wsdl_url = "file://#{File.expand_path(wsdl)}"

    # Create the server
    worker = WSDL::SOAP::WSDL2Ruby.new
    worker.logger = logger
    worker.location = wsdl_url
    worker.basedir = basedir
    worker.opt['force'] = true
    worker.opt['classdef'] = "jiraService"
    worker.opt['module_path'] ="Jira4R::V#{version}"
    
    worker.opt['mapping_registry'] = true
    #worker.run
    
    #Create the driver
    #worker = WSDL::SOAP::WSDL2Ruby.new
    #worker.logger = logger
    #worker.location = wsdl_url
    #worker.basedir = basedir
    #worker.opt['force'] = true
    #worker.opt['module_path'] = "Jira4R::V#{version}"

    worker.opt['driver'] = "JiraSoapService"
    worker.run
  }
end

def versions 
 [ 2 ]
end

def get_file(host, path)
    puts "getting http://#{host}#{path}"
    http = Net::HTTP.new(host)
    http.start { |w| w.get2(path).body }
end

def getWsdlFileName(vName)
  "wsdl/jirasoapservice-v#{vName}.wsdl"
end


# Saves this document to the specified @var path.
# doesn't create the file if contains markup for 404 page
def save( path, content )
  File::open(path, 'w') { | f | 
    f.write( content ) 
  }
end

def fix_soap_files(version)
  fix_require("lib/jira4r/v#{version}/jiraServiceMappingRegistry.rb")
  fix_require("lib/jira4r/v#{version}/JiraSoapServiceDriver.rb")
end

def fix_require(filename)
  content = ""
  File.open(filename) { |io| 
    content = io.read()
    
    content = fix_content(content, 'jiraService')
    content = fix_content(content, 'jiraServiceMappingRegistry')
  }
  
  File.open(filename, "w") { |io| 
    io.write(content)
  }
end

def fix_content(content, name)
  return content.gsub("require '#{name}.rb'", "require File.dirname(__FILE__) + '/#{name}.rb'")
end

SPEC_DIR = File.join(File.dirname(__FILE__), 'spec')
FIXTURE_DIR = File.join(SPEC_DIR, 'fixtures')
SPECS = "#{SPEC_DIR}/*_spec.rb"

begin
  require 'spec/rake/spectask'
  
  begin
    require 'rcov/rcovtask'

    Spec::Rake::SpecTask.new do |t|
      t.libs << SPEC_DIR
      t.pattern = SPECS
      t.rcov = true
      t.rcov_dir = "#{SPEC_DIR}/coverage"
      t.verbose = true
    end
  
    desc "Generate and open coverage reports"
    task :rcov do
      system "open #{SPEC_DIR}/coverage/index.html"
    end
    task :rcov => :spec
  rescue LoadError
    ### Enabling these warnings makes every run of rake whiny unless you have these gems.
    # warn ">>> You don't seem to have the rcov gem installed; not adding coverage tasks"
    Spec::Rake::SpecTask.new do |t|
      t.libs << SPEC_DIR
      t.pattern = SPECS
      t.verbose = true
    end
  end
rescue LoadError
  # warn ">>> You don't seem to have the rspec gem installed; not adding rspec tasks"
end
