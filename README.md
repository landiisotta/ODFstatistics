##ODFLab code: build and import datasets

###Instruction of use
**Download RStudio (open source software for R) from**
```
https://www.rstudio.com/products/rstudio/download/
```

**Download the zip file from GitHub**

**Unpack it in the working directory**

**Read carefully the document**
```
db_structure.pdf
```

**Check if your dataset respect the structure required in the previous document**

**Open the following file in RStudio**
```
importds.R
```

**Change the variable values:**
```
path -> insert the path to your working directory between quotes

dataset.name -> insert the name of your file to read between quotes

typedf -> insert the type of your dataset aas explained in 'db_structure.pdf'

nfact -> insert the number of the variables that are NOT time dependent. Do not include the column of subject ids and the column of times (if any)

nsheet -> insert the number of sheet for the sheet format dataset. Otherwise leave the variable initialized a s NULL.
```

**Run the code with RStudio** 

**The databases are stored in the variables:**
```
database.long -> long format dataframe
database.wide -> wide format dataframe 
```
