module Dsl
  module Latex
    class Simple
        attr_accessor :out

        def initialize()
          @out = ''
        end
        
        def macro(name)
          if name.length > 0
            if name[0].is_a? Array
              opt = name.shift
              @out << "["+opt.join('][')+"]"
            end
            @out << "{"+name.join('}{')+"}"
          end
          @out << "\n"
        end

        def tag(tagname, *name, &block)
          if tagname == :start
            tagname = :begin
          end
          @out << "\\#{tagname}"
          @out << '{' if block_given? and tagname != :begin
          macro(name)
          if block_given?
            # create a new object and translate it
            # then concat its output
            aux = Dsl::Latex::Simple.new
            aux.instance_eval &block
            content = aux.out
            if content
              @out << content.to_s 
            end
            @out << ((tagname == :begin)? "\\end" : '}')
            macro(name)
          end
          nil
        end
          
        alias method_missing tag
        

        def esc(s)
          s.gsub!('\\','\\\\')
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
    end
  end
end
if $0 == __FILE__
 Dsl::Latex::Simple.generate('example.rex')
end

