require "bundler/gem_tasks"

task :default => :compile

task :compile do
  sh "ruby -Ilib lib/dsl-latex-simple/simple.rb > simple.tex"
end

task :c0 do
  sh "ruby -Ilib bin/rex example0.rex > simple.tex"
end

task :dvi do
  sh "latex simple.tex"
end

task :html do
  sh "latex2html simple"
end

task :clean do
  sh "rm -f *.log *.dvi *.aux"
end
