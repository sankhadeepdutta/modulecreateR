# Code template when user selects 'default' as content type
default_snippet <-
  "library(shiny)

ui <- function(id) {
  ns <- NS(id)
    }
                      
server <- function(id) {
  moduleServer(id,
               function(input, output, session) {}
               )}"

# Code template when user selects 'named' as content type
named_snippet <- 
  "library(shiny)

%sUI <- function(id) {
  ns <- NS(id)
}

%sServer <- function(id) {
  moduleServer(id,
               function(input, output, session) {
               })
}"

#' @name create_modules
#' @title Create Shiny module files
#' @description 
#' This function allows users to create multiple Shiny module files quickly and easily. 
#' Users can specify the path where they want to save the files, the number 
#' of files they want to create, and the content type for each file. The 
#' function supports two content types: 'default' and 'named'. 
#' For the 'default' content type, the module template uses default object names. 
#' For the 'named' content type, the module template uses object names which 
#' includes the file name.
#' 
#' @details
#' This function prompts the user to provide:
#' \itemize{
#'   \item The path where they want to save the files.
#'   \item The number of files they want to create.
#'   \item The names of the files.
#'   \item The content type for each file ('default' or 'named').
#' }
#'
#' @return This function does not return any value.
#' 
#' @usage 
#' create_modules()
#'         
#' @export

create_modules <- function() {
  # Show current working directory
  cat("Current working directory:", getwd(), "\n")
  
  # Get the path from the user (relative)
  file_path <- readline(prompt = "Enter the relative path where you want to save the files: ")
  
  # Check if the path exists
  if (!file.exists(file_path)) {
    stop("The specified path does not exist.")
  }
  
  # Ask for number of files
  num_files <- as.numeric(readline(prompt = "Enter the number of files to create: "))
  
  # Check for valid input
  if (is.na(num_files) || num_files <= 0) {
    stop("Invalid input. Please enter a positive integer.")
  }
  
  # Create an empty list to store filenames
  filenames <- vector(mode = "character", length = num_files)
  
  # Get filenames from user
  for (i in 1:num_files) {
    filenames[i] <- readline(paste0("Enter the name of file ", i, ": "))
  }
  
  # Get content choice
  content_choice <- readline(prompt = "Enter content type (default/named): ")
  
  # Check for valid input
  if (!all(content_choice %in% c("default", "named"))) {
    stop("Invalid input. Please choose 'default' or 'named'.")
  }
  
  # Construct full paths with the specified path
  full_paths <- file.path(file_path, filenames)
  
  # Write content to files
  for (i in 1:num_files) {
    filename <- paste0(full_paths[i], ".R")
    content <- ifelse(content_choice == "default", 
                      default_snippet, 
                      sprintf(named_snippet, filenames[i], 
                              filenames[i]))
    write(content, file = filename)
    cat("File ", filename, " created successfully.\n")
  }
}
