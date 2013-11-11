x = readLines('reactive-programming.tex')
i1 = which(x == '\\begin{abstract}')[1]
i2 = which(x == '\\end{abstract}')[1]
i3 = which(x == '\\section{Introduction}')
i4 = grep('^\\\\bibliography.+', x)[1]
x = gsub('^\\\\section', '\\\\chapter', x)
x = gsub('^\\\\subsection', '\\\\section', x)
x = gsub('^\\\\subsubsection', '\\\\subsection', x)
writeLines(c(x[i1:i2], x[i3:(i4 - 1)]), 'part-ii.tex')
