# Load packages
library(rmarkdown)
library(stringr)
library(magrittr)

# Set working directory
setwd("~/Mirror/zaharchuk-cv")

# Render initial files
render("Zaharchuk_CV_temp.Rmd")

# Bold name
readr::read_lines("Zaharchuk_CV_temp.tex") %>% 
  str_replace_all("Zaharchuk, H. A.", "\\\\textbf{Zaharchuk, H. A.}") %>%
  str_replace_all("Zaharchuk, H.", "\\\\textbf{Zaharchuk, H.}") %>%
  readr::write_lines("Zaharchuk_CV.tex")

# Compile PDF
tinytex::latexmk("Zaharchuk_CV.tex", engine = "xelatex") 