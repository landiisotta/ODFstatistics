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

**Check if your dataset respects the structure required in the previous document**

**Open the following file in RStudio**
```
importds.R
```

**Change the variable values:**
```
path -> insert the path to your working directory between quotes

dataset.name -> insert the name of the file to read between quotes

typedf -> insert the type of your dataset as explained in 'db_structure.pdf' 
('l' for long format, 'w' for wide format, 'sh' for sheet format, 
'nolong' for not-longitudinal format)

nfact -> insert the number of variables that are NOT time dependent. Do not include the column of subject ids and the column of times (if any)

nsheet -> insert the number of sheets for the sheet format dataset. Otherwise leave the variable initialized as NULL
```

**Run the code with RStudio** 

**If the study is longitudinal, the databases are stored in the variables:**
```
database.long -> long format dataframe
database.wide -> wide format dataframe 
```

**If the study is not longitudinal, the database is stored in the variable:**
```
database
```

**NB all the required packages can be downloaded directly with RStudio or with**
```
install.packages('package_name')
```
