require 'simplabs/highlight'
module Dsl
  module Latex
    class Simple
        attr_accessor :out

        def initialize()
          @out = ''
        end
        
        def macro_begin(name, tagname, block)
          @out << "\\#{tagname}"
          @out << '{' if block and tagname != :begin
          name.each do |n|
            if n.is_a? Array
              @out << "["+n.join('][')+"]"
            else
              @out << "{#{n}}"
            end
          end
          @out << "\n"
        end

        def macro_end(name, tagname)
          if tagname == :begin
            @out << "\\end{#{name[0]}}" 
          else
            @out << '}'
            name.each do |n|
              if n.is_a? Array
                @out << "["+n.join('][')+"]"
              else
                @out << "{#{n}}"
              end
            end
          end
          @out << "\n"
        end

        def tag(tagname, *name, &block)
          if tagname == :start
            tagname = :begin
          end
          macro_begin(name, tagname, block_given?)
          if block_given?
            # create a new object and translate it
            # then concat its output
            aux = Dsl::Latex::Simple.new
            aux.instance_eval &block
            content = aux.out
            if content
              @out << content.to_s 
            end
            macro_end(name, tagname)
          end
          nil
        end
          
        alias method_missing tag

        def esc(s)
          s.gsub!(%q{\\},%q{\\\\})
          s
        end

        def trim(s)
          s.gsub!(/^\s+/,'')
          s.gsub!(/\s+$/,'')
          s
        end

        def c(*x)
          @out << x.join("\n")+"\n"
        end

        def self.generate(path)
          s = File.read(path)
          x = Dsl::Latex::Simple.new 
          x.instance_eval(s, path, 1)
          puts x.out
        end

        def highlight_code(language, code)
          start %q{rawhtml} do
            hl = Simplabs::Highlight.highlight(language, code)
            c "<pre>\n#{hl}\n</pre>\n"
          end

          start %q{latexonly} do
            start :lstlisting, %Q{language=#{language}} do
              c code
            end
          end
        end

    end
  end
end
if $0 == __FILE__
 Dsl::Latex::Simple.generate('examples/example.rex')
end

