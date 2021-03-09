# Render Markdown
setwd("~/Mirror/zaharchuk-cv")
rmarkdown::render("Zaharchuk_CV_temp.Rmd")

# Load packages
library(stringr)
library(magrittr)

# Bold name
readr::read_lines("Zaharchuk_CV_temp.tex") %>% 
  str_replace_all("Zaharchuk, H. A.", "\\\\textbf{Zaharchuk, H. A.}") %>%
  str_replace_all("Zaharchuk, H.", "\\\\textbf{Zaharchuk, H.}") %>%
  readr::write_lines("Zaharchuk_CV.tex")

# Compile PDF
tinytex::latexmk("Zaharchuk_CV.tex", engine = "xelatex") 
