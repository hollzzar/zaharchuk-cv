# Load packages
library(rmarkdown)
library(stringr)
library(magrittr)
library(vitae)

# Set working directory
setwd("~/Mirror/zaharchuk-cv")

# Render initial files
# There will be an error about failing to compile the tex file
# I included the pronouns argument to prevent vitae from removing the intermediate tex file
# (despite including keep_tex and other trouble-shooting efforts)
render("Zaharchuk_CV_temp.Rmd")

# # Remove temp pdf
#   # I don't render directly to tex because it throws an error
# unlink("Zaharchuk_CV_temp.pdf")

# Manually remove \prounouns (line 65) from tex file before moving to the next step

# Bold name and change fake year to in press
readr::read_lines("Zaharchuk_CV_temp.tex") %>% 
  str_replace_all("Zaharchuk, H. A.", "\\\\textbf{Zaharchuk, H. A.}") %>%
  str_replace_all("Zaharchuk, H.", "\\\\textbf{Zaharchuk, H.}") %>%
  str_replace_all("2050", "in press") %>%
  readr::write_lines("Zaharchuk_CV.tex")

# Compile PDF
tinytex::latexmk("Zaharchuk_CV.tex", engine = "xelatex")

