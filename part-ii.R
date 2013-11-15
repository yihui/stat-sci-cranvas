x = readLines('reactive-programming.tex')
# extract abstract
i1 = which(x == '\\begin{abstract}')[1]
i2 = which(x == '\\end{abstract}')[1]
# extract body
i3 = which(x == '\\section{Introduction}')
i4 = grep('^\\\\bibliography.+', x)[1]
# uppercase chapter headings
x = gsub('^\\\\section\\{([^}]+)\\}', '\\\\chapter{\\U\\1}', x, perl = TRUE)
# First Letter Uppercase
i = grep('^\\\\subsection\\{([^}]+)\\}', x)
x[i] = gsub(' (.)', ' \\U\\1', x[i], perl = TRUE)
x[i] = gsub('Cranvas', 'cranvas', x[i])
# increase section levels
x = gsub('^\\\\subsection\\{([^}]+)\\}', '\\\\section{\\1}', x)
x = gsub('^\\\\subsubsection', '\\\\subsection', x)
# Section n => Chapter n
x = gsub('Section \\ref{sec:', 'Chapter \\ref{sec:', x, fixed = TRUE)

# okay, ready for the thesis now
writeLines(c(x[i1:i2], x[i3:(i4 - 1)]), 'part-ii.tex')
