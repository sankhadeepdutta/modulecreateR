## Overview

The goal of modulecreateR is to provide a fast and friendly way to create multiple R shiny module templates at once.

## Installation

```{r, eval = FALSE}
# The easiest way to install modulecreateR:
devtools::install_github("https://github.com/sankhadeepdutta/modulecreateR")
```

## Usage

```{r}
library(modulecreateR)
create_modules()
```

## Example
```{r}
create_modules()
Current working directory: D:/test 
Enter the (relative) path where you want to save the files: views
Enter the number of files to create: 1
Enter the name of file 1: Card
Enter content type (default/named): named
File Card.R  created successfully.
```

## Important notes

- Provide only relative path, in case you want to put the modules in the working directory, enter the value "./"
- While providing the names of the modules, do not use the ".R" file extension, it is taken care of automatically.
