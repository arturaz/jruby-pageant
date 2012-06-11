# encoding: utf-8
@spec = Gem::Specification.new do |s|
  s.name = "jruby-pageant"
  s.version = "1.1.1"
  s.summary = "jruby-pageant allows Pageant access on JRuby + Windows"
  s.description = "This is a convenience gem packaging required JNA/JSCH jars."
  s.authors = ["Artūras Šlajus"]
  s.email = ["arturas.slajus@gmail.com"]
  s.homepage = "http://github.com/arturaz/jruby-pageant"

  s.has_rdoc = false
  s.executables = %w[]

  if RUBY_PLATFORM == "java"
    s.platform = RUBY_PLATFORM
    s.require_paths = %w[lib-java]
    s.files = Dir["ext/*"] + Dir["lib-java/*"]
  else
    s.require_paths = %w[lib-fake]
    s.files = Dir["lib-fake/*"]
  end
end
