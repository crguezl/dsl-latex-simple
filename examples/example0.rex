require 'simplabs/highlight'

documentclass ["12pt"], "article"
usepackage ['pdftex'], %q{graphicx}
usepackage %q{html}
usepackage ["fleqn"], %q{amsmath}
usepackage ["paper=a4paper,dvips,top=1.5cm,left=1.5cm,right=1.5cm,
    foot=1cm,bottom=1.5cm"], "geometry"
usepackage ['spanish'], %q{babel}    
usepackage %q{ucs}
usepackage ['utf8x'], %q{inputenc}

newcommand %q{\lb}, %q{{\langle}}

title "An elementary proof of the reconstruction conjecture"

author do
  c('Dagwood Remifa')
  thanks(%q{Thanks to the editors of this wonderful journal!})
  c '\\\\'
end


date { today }

start "document" do
  maketitle
  start "abstract" do
    c esc %q{ The reconstruction conjecture states that the multiset of unlabeled
    vertex-deleted subgraphs of a graph determines the graph, provided it
    has at least 3 vertices.  A version of the problem was first stated
    by Stanislaw Ulam.  In this paper, we show that the conjecture can
    be proved by elementary methods.  It is only necessary to integrate
    the Lenkle potential of the Broglington manifold over the quantum
    supervacillatory measure in order to reduce the set of possible
    counterexamples to a small number (less than a trillion).  A simple
    computer program that implements Pipletti's classification theorem
    for torsion-free Aramaic groups with simplectic socles can then
    finish the remaining cases.  }
  end
  c "Hola, hoy son las #{Time.now} y $\\sqrt{2} = #{Math.sqrt(2)}$"
  start "verbatim" do
   c "a = 4*5"
   c "b = 4*5"
  end

  start %q{equation} do
    c esc '\Delta =\sum_{i=1}^N w_i (x_i - \bar{x})^2.'
  end

  c %q{We can give an equation a label so that we can refer to it later.}
  start %q{equation} do
    label %q{eq:ising}
    c %q{E = -J \sum_{i=1}^N s_i s_{i+1},}
  end
  c esc %q{Equation~\eqref{eq:ising} expresses the energy of a configuration
  of spins in the Ising model.\footnote{It is necessary to typeset a
  file twice to get the counters correct.}
  }

  htmladdnormallink %q{https://github.com/cocoa/eloquent-ruby}, %q{https://github.com/cocoa/eloquent-ruby}

  start %q{align} do c trim(%q{
    a & = b \\\\
    c &= d,})
  end

  start %q{rawhtml} do
    c Simplabs::Highlight.highlight(:ruby, 'class Test; end')
  end

  start %q{latexonly} do
    start :verbatim do
      c 'class Test; end'
    end
  end

  start(%q{tabular}, %q{|c|}) do
    hline
    c %q{
    test1\\\\
    test2\\\\
    }
    hline
  end

  input "examples/section.tex"

  start %q{figure}, [ 'htb' ] do
    start %q{center} do
      includegraphics ['scale=0.7'], %q{examples/fibonacci.png}
    end
    label %q{figure:fibonacci}
    caption %q{Arbol de llamadas para la función de Fibonacci}
  end
end
