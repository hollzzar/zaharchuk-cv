# Load packages
library(rmarkdown)
library(stringr)
library(magrittr)
library(vitae)

# Set working directory
setwd("~/Mirror/zaharchuk-cv")

# Render initial files
render("Zaharchuk_CV_temp.Rmd")

# Remove temp pdf
  # I don't render directly to tex because it throws an error
unlink("Zaharchuk_CV_temp.pdf")

# Bold name
readr::read_lines("Zaharchuk_CV_temp.tex") %>% 
  str_replace_all("Zaharchuk, H. A.", "\\\\textbf{Zaharchuk, H. A.}") %>%
  str_replace_all("Zaharchuk, H.", "\\\\textbf{Zaharchuk, H.}") %>%
  readr::write_lines("Zaharchuk_CV.tex")

# Compile PDF
tinytex::latexmk("Zaharchuk_CV.tex", engine = "xelatex")
