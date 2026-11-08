# Employee Salary Data Processing

## Project Overview

This project processes employee salary data using Python in a Jupyter Notebook and R in Visual Studio Code. The Python notebook imports and prepares `Total.csv`, creates an employee dictionary, retrieves employee records by name, handles errors, exports a selected employee profile to CSV, and creates `Employee Profile.zip`. The R script extracts the ZIP archive and displays the exported employee data.

## Project Requirements

The project addresses the following requirements:

- Import the provided salary dataset into a Jupyter Notebook.
- Create a Python function that accepts an employee name and returns matching details.
- Process the salary data using a Python dictionary.
- Implement error handling for data, search, export, and file-processing issues.
- Export an employee profile to a CSV file.
- Save the employee CSV in `Employee Profile.zip`.
- Use R to unzip the archive and display the employee data.
- Include instructions for running the Python and R files.

## Technologies Used

- Python 3
- Jupyter Notebook
- pandas
- R
- Visual Studio Code
- Python `pathlib` module
- Python `zipfile` module

## Project Files

```text
employee-salary-data-processing/
|
|-- Total.csv
|-- employee_salary_processing.ipynb
|-- unzip_employee_profile.R
|-- Employee Profile.zip
|-- README.md
|-- .gitignore
|
|-- Employee Profile/
|   `-- employee_profile.csv
|
`-- Extracted Employee Profile/
    `-- Employee Profile/
        `-- employee_profile.csv
```

### Essential Submission Files

- `Total.csv`: Original salary dataset.
- `employee_salary_processing.ipynb`: Python Jupyter Notebook containing the data-processing workflow.
- `unzip_employee_profile.R`: R script that extracts and displays the employee profile.
- `Employee Profile.zip`: ZIP archive containing the exported employee CSV.
- `README.md`: Project instructions and documentation.

The `Employee Profile` and `Extracted Employee Profile` folders are generated when the Python notebook and R script are run.

## Dataset Fields

The salary dataset contains the following columns:

- `EmployeeName`
- `JobTitle`
- `BasePay`
- `OvertimePay`
- `OtherPay`
- `Benefits`
- `TotalPay`
- `TotalPayBenefits`
- `Year`

## Data Preparation

The notebook performs the following preparation steps:

1. Imports `Total.csv` into a pandas DataFrame.
2. Reviews the dataset dimensions, columns, and data types.
3. Converts compensation columns to numeric values.
4. Converts invalid text entries such as `Not Provided` to `NaN`.
5. Checks missing values, duplicate rows, and repeated employee names.
6. Preserves repeated employee records when creating the dictionary.

A missing value is not automatically replaced with zero because an unavailable amount is different from a confirmed payment of zero.

## Employee Dictionary

Employee names are cleaned and converted to lowercase for case-insensitive searching. Each normalized name is connected to a list of matching records.

```python
{
    "normalized employee name": [
        {
            "EmployeeName": "ORIGINAL EMPLOYEE NAME",
            "JobTitle": "JOB TITLE",
            "BasePay": 100000.00,
            "Year": 2011
        }
    ]
}
```

Using a list prevents records from being overwritten when an employee name appears more than once.

## Employee Lookup Function

The `get_employee_details()` function:

- Accepts an employee name as text.
- Removes surrounding spaces.
- Performs a case-insensitive dictionary search.
- Returns all records matching the normalized name.
- Returns an empty list after handling an unsuccessful search.

The function handles:

- Non-text input
- Empty employee names
- Employee names that are not found
- Unexpected processing errors

## Exported Employee Profile

The notebook selects `NATHANIEL FORD` as the reproducible export example. Matching details are saved to:

```text
Employee Profile/employee_profile.csv
```

The CSV is then added to:

```text
Employee Profile.zip
```

The expected archive structure is:

```text
Employee Profile.zip
`-- Employee Profile/
    `-- employee_profile.csv
```

## Python Setup in Visual Studio Code

### Requirements

Install:

- Python 3
- Visual Studio Code
- Microsoft Python extension
- Microsoft Jupyter extension
- pandas
- ipykernel

Install the required Python packages from the Visual Studio Code terminal:

```bash
python -m pip install pandas ipykernel
```

If the system uses `python3`, run:

```bash
python3 -m pip install pandas ipykernel
```

## Run the Jupyter Notebook

1. Open the project folder in Visual Studio Code.
2. Open `employee_salary_processing.ipynb`.
3. Select a Python kernel containing `pandas` and `ipykernel`.
4. Confirm that `Total.csv` is in the same folder as the notebook.
5. Select **Restart Kernel**.
6. Select **Run All**.
7. Confirm that no cell produces an unhandled error.
8. Confirm that the final requirement checks display `Passed`.
9. Confirm that the ZIP integrity check displays `Passed`.

Expected Python outputs include:

```text
Employee profile exported successfully.
ZIP archive created successfully.
ZIP integrity check: Passed
```

## R Setup in Visual Studio Code

### Requirements

Install:

- R
- Visual Studio Code
- R extension for Visual Studio Code

The optional `languageserver` package improves R editing support:

```r
install.packages("languageserver")
```

The project R script itself uses base R and does not require an external package.

## Run the R Script

Ensure `Employee Profile.zip` and `unzip_employee_profile.R` are in the same project folder.

### R Terminal Method

Open an R terminal in Visual Studio Code and run:

```r
source("unzip_employee_profile.R")
```

### Regular Visual Studio Code Terminal Method

Run:

```bash
Rscript "unzip_employee_profile.R"
```

The R script will:

1. Confirm that `Employee Profile.zip` exists.
2. Create a fresh extraction folder.
3. Extract the ZIP archive.
4. Search recursively for `employee_profile.csv`.
5. Import and display the employee data.
6. Display the number of records and columns processed.

Expected R summary:

```text
PROCESSING SUMMARY
==============================
Records displayed: 1
Columns displayed: 9
Status: Employee profile displayed successfully.
```

## Error Handling

### Python

The notebook handles:

- Missing CSV files
- Empty CSV files
- CSV parsing errors
- Invalid employee-name input
- Employees that cannot be found
- CSV export errors
- ZIP creation and verification errors

### R

The R script handles:

- Missing ZIP archives
- Extraction-folder creation failures
- Missing extracted CSV files
- Empty employee profiles
- Unexpected extraction or display errors

## Reproducing the Results

For a complete test:

1. Place `Total.csv` beside the notebook.
2. Restart the Python kernel and run all notebook cells.
3. Confirm that `Employee Profile.zip` is created.
4. Run `unzip_employee_profile.R`.
5. Confirm that the employee profile and processing summary appear in the R terminal.

Relative file paths are used so the project can run on another computer without editing a personal Windows path.

## Data Privacy

The repository is intended for educational and portfolio use. Before publishing the project publicly, confirm that `Total.csv` is approved for public distribution and does not contain confidential or restricted employee information.

## Learning Outcomes

This project demonstrates:

- CSV import with pandas
- Data type conversion
- Missing-value handling
- Dictionary processing
- Function development
- Case-insensitive employee lookup
- Exception handling
- CSV export
- ZIP archive creation and validation
- R archive extraction
- Cross-language file processing
- Jupyter Notebook documentation

## Author

Oluremi Moses Akindeko

## Purpose

Developed as part of a Master of Science in Data Analytics course assignment focused on programming in Python and R.

## License

This project is intended for educational and portfolio purposes.