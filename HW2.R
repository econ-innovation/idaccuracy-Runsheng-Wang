#  Class Exercises in R Basics
## Runsheng Wang
## date: 2023-12-08
#  ================================================================
## program prepare

rm(list = ls()) 

data_path <- "~/Dropbox/bigdata_econ_2023/data/assignment_idaccuracy/Aminer"
setwd(data_path)

# get the names of all files 
file_names <- list.files()

# use an empty list to restore the file names 
data_merge <- data.frame()

# record the time used in import/merging

start_time <- Sys.time()

# use a loop to read and merge 

for (file in file_names) {
  
  file_path <- file.path(data_path, file)
  
  current_data <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
  data_merge <- rbind(data_merge, current_data)
  
}

end_time <- end_time <- Sys.time()
mer_time <- end_time - start_time

print(mer_time)

print(head(data_merge))

# Use lapply function 

# record the time used in import/merging

start_time <- Sys.time()

data_merge1 <- do.call(rbind, lapply(file_names, function(file) {
  
  file_path1 <- file.path(data_path, file)
  current_data1 <- read.csv(file_path1)
  
  return(current_data1)
}))

end_time <- Sys.time()
mer_time1 <- end_time - start_time

print(mer_time1)

print(head(data_merge1))

# test the differences

result <- all.equal(data_merge, data_merge1)
print(result)


