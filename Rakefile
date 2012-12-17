require "bundler/gem_tasks"

LATEX2HTMLOPTIONS = '-html_version 4.0,latin1,unicode -contents_in_navigation -style mystyle.css -white -local_icons'

task :default => :compile

desc "Uses the example inside lib/dsl-latex-simple/simple.rb"
task :compile do
  sh "ruby -Ilib lib/dsl-latex-simple/simple.rb > examples/simple.tex"
end

desc "compiles example0.rex onto examples/simple.tex"
task :c0 do
  sh "ruby -Ilib bin/rex examples/example0.rex > examples/simple.tex"
end

desc "simple.tex -> simple.dvi"
task :dvi do
  sh "latex -output-directory=examples  examples/simple.tex"
end

desc "simple.tex -> simple.pdf"
task :pdf do
  sh "pdflatex -output-directory=examples  examples/simple.tex"
end

task :html do
  sh "latex2html #{LATEX2HTMLOPTIONS} examples/simple"
  sh "cp examples/mystyle.css examples/simple/"
end

desc "Have a look to the .dvi generated"
task :look do
  sh "open examples/simple.dvi"
end

task :clean do
  sh "rm -f examples/*.log examples/*.dvi examples/*.aux examples/*.pdf"
  sh "rm -fR examples/simple"
end

desc "Generates a pygmentize CSS"
task :css do
  sh "pygmentize -f html -S colorful > examples/colorful.css"
end
