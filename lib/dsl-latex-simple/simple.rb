module Dsl
  module Latex
    class Simple
        def initialize(out)
          @out = out
        end
        
        def tag(tagname, name=nil)
          if tagname == :start
            tagname = :begin
          end
          @out << "\\#{tagname}"
          if name
            @out << "\{#{name}\}"
          end
          @out << "\n"
          if block_given?
            content = yield
            if content
              @out << content.to_s << "\n"
            end
            @out << "\\end"
            if name 
              @out << "\{#{name}\}"
            end
            @out << "\n"
          end
          nil
        end
          
        alias method_missing tag
        
        def self.generate(out, &block)
          Dsl::Latex::Simple.new(out).instance_eval(&block)
        end

        def c(*x)
          @out << x.join("\n")+"\n"
        end
    end
  end
end
if $0 == __FILE__
  Dsl::Latex::Simple.generate(STDOUT) do
    documentclass "article"
    usepackage "amsmath"
    title "\\LaTeX"
    date ""
    start "document" do
      c "Hola, hoy son las #{Time.now} y $\\sqrt{2} = #{Math.sqrt(2)}$"
      start "verbatim" do
       "a = 4*5"
      end
  end
end
end

