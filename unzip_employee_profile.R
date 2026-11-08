# Employee Salary Data Processing
# Unzip and display the exported employee profile


# ---------------------------------------------------------
# DEFINE FILE LOCATIONS
# ---------------------------------------------------------

# Define the ZIP file created by the Python notebook
zip_file <- "Employee Profile.zip"

# Define the folder for the extracted files
extraction_folder <- "Extracted Employee Profile"


# ---------------------------------------------------------
# EXTRACT AND DISPLAY THE EMPLOYEE PROFILE
# ---------------------------------------------------------

tryCatch({

  # Confirm that the ZIP file exists
  if (!file.exists(zip_file)) {
    stop(
      paste(
        zip_file,
        "could not be found in the current project folder."
      )
    )
  }

  # Remove the old extraction folder if it exists
  if (dir.exists(extraction_folder)) {
    unlink(
      extraction_folder,
      recursive = TRUE,
      force = TRUE
    )
  }

  # Create a new extraction folder
  folder_created <- dir.create(
    extraction_folder,
    recursive = TRUE,
    showWarnings = FALSE
  )

  # Confirm that the extraction folder exists
  if (!dir.exists(extraction_folder)) {
    stop(
      "The extraction folder could not be created."
    )
  }

  # Extract the contents of Employee Profile.zip
  unzip(
    zipfile = zip_file,
    exdir = extraction_folder,
    overwrite = TRUE
  )

  cat("ZIP archive extracted successfully.\n")
  cat("Extraction folder:", extraction_folder, "\n")

  # Search the extraction folder and all subfolders
  # for employee_profile.csv
  matching_csv_files <- list.files(
    path = extraction_folder,
    pattern = "^employee_profile\\.csv$",
    recursive = TRUE,
    full.names = TRUE,
    ignore.case = TRUE
  )

  # Confirm that at least one matching CSV was found
  if (length(matching_csv_files) == 0) {

    # Display extracted files to make troubleshooting easier
    extracted_files <- list.files(
      path = extraction_folder,
      recursive = TRUE,
      full.names = TRUE
    )

    if (length(extracted_files) > 0) {
      cat("\nFiles found after extraction:\n")

      for (file_name in extracted_files) {
        cat("-", file_name, "\n")
      }
    }

    stop(
      paste(
        "employee_profile.csv could not be found",
        "after extracting the ZIP archive."
      )
    )
  }

  # Use the first matching employee profile CSV
  employee_csv <- matching_csv_files[1]

  cat("Employee profile located successfully.\n")
  cat("CSV file:", employee_csv, "\n")

  # Read the employee profile CSV
  employee_profile <- read.csv(
    file = employee_csv,
    stringsAsFactors = FALSE,
    check.names = FALSE,
    na.strings = c("", "NA", "NaN")
  )

  # Confirm that the CSV contains at least one record
  if (nrow(employee_profile) == 0) {
    stop(
      "The extracted employee profile contains no records."
    )
  }

  # Confirm that the CSV contains columns
  if (ncol(employee_profile) == 0) {
    stop(
      "The extracted employee profile contains no columns."
    )
  }

  # Display the employee profile
  cat("\nEMPLOYEE PROFILE\n")
  cat("==============================\n")

  print(
    employee_profile,
    row.names = FALSE
  )

  # Display the processing summary
  cat("\nPROCESSING SUMMARY\n")
  cat("==============================\n")

  cat(
    "Records displayed:",
    nrow(employee_profile),
    "\n"
  )

  cat(
    "Columns displayed:",
    ncol(employee_profile),
    "\n"
  )

  cat(
    "Source file:",
    employee_csv,
    "\n"
  )

  cat(
    "Status: Employee profile displayed successfully.\n"
  )

}, error = function(error) {

  # Display a clear error message
  cat(
    "\nProcessing error:",
    conditionMessage(error),
    "\n"
  )
})