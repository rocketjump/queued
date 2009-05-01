# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{queued}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathaniel Bibler"]
  s.date = %q{2009-04-01}
  s.description = %q{}
  s.email = ["gem@nathanielbibler.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/core_extensions/extract_options.rb", "lib/queued.rb", "lib/queued/message.rb", "lib/queued/queue.rb", "lib/queued/service.rb", "lib/queued/services/amazon_sqs.rb", "lib/queued/services/amazon_sqs/message.rb", "lib/queued/services/amazon_sqs/queue.rb", "lib/queued/services/amazon_sqs/service.rb", "lib/queued/services/test.rb", "lib/queued/services/test/message.rb", "lib/queued/services/test/queue.rb", "lib/queued/services/test/service.rb", "queued.gemspec", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_queued.rb"]
  s.has_rdoc = true
  s.homepage = %q{Abstraction layer for Ruby message queues.}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{queued}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{}
  s.test_files = ["test/test_helper.rb", "test/test_queued.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
