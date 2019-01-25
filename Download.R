library(rentrez)

# 1. Add lines to your script.
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")


# 2. Add commnets to explain what each line of your script does.
# entrez_fetch -- pass unique identifiers to an NCBI database and receive data files in a variety of formats
# db -- name of the database to used 
# id -- unique ID for records in the database
# rettype -- format in which to get data


# 3. Take a look at the Bburg object.
print(Bburg)
class(Bburg)
summary(Bburg)


# 4. Use the strsplit() function in combination with others to create a vector of 3 components, one for each sequence

### First, clean up the sequence
Bburg<-gsub("[\n /]+", "", Bburg)
print(Bburg)

newbburg<-strsplit(Bburg, ">HQ433",  fixed = FALSE)
newbburg<-unlist(newbburg, recursive=TRUE, use.names=TRUE)

### Output the vector to a file called Sequences.csv
write.csv(newbburg, "Sequences.csv")