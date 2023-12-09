# merge_data.R

if (length(commandArgs(trailingOnly = TRUE)) != 1) {
  stop("Usage: Rscript merge_data.R <path_to_data>")
}

data_path <- commandArgs(trailingOnly = TRUE)[1]

# Set the dir
setwd(data_path)

# Get the names of all files
file_names <- list.files()

data_merge <- do.call(rbind, lapply(file_names, function(file) {
  # Build the complete file path
  file_path <- file.path(data_path, file)
  
  # Use read.csv function to read the file
  current_data <- read.csv(file_path)
  
  return(current_data)
}))

print(head(data_merge))
