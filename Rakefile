require "bundler/gem_tasks"

LATEX2HTMLOPTIONS = '-html_version 4.0,latin1,unicode -contents_in_navigation -style mystyle.css -white -local_icons'

task :default => :compile

task :compile do
  sh "ruby -Ilib lib/dsl-latex-simple/simple.rb > examples/simple.tex"
end

task :c0 do
  sh "ruby -Ilib bin/rex examples/example0.rex > examples/simple.tex"
end

task :dvi do
  sh "latex -output-directory=examples  examples/simple.tex"
end

task :html do
  sh "latex2html #{LATEX2HTMLOPTIONS} examples/simple"
  sh "cp examples/mystyle.css examples/simple/"
end

task :clean do
  sh "rm -f examples/*.log examples/*.dvi examples/*.aux"
  sh "rm -fR examples/simple"
end
