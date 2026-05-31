# Project 1: Data Cleaning and Validation

This project cleans and validates an e-commerce orders dataset before any exploratory analysis is performed. The focus is on basic data reliability: missing values, duplicates, data types, invalid values, and revenue calculation checks.

It is intentionally a smaller project than the EDA work. The value here is in showing a disciplined cleaning process, not in producing visualizations.

## Objective

Prepare the raw Excel dataset for later analysis by checking whether the order records are complete, consistent, and safe to use.

## Dataset

The dataset contains `1,200` rows and `14` columns. Each row represents one e-commerce order.

Main fields include:

- `OrderID`
- `Date`
- `CustomerID`
- `Product`
- `Quantity`
- `UnitPrice`
- `PaymentMethod`
- `OrderStatus`
- `ItemsInCart`
- `CouponCode`
- `ReferralSource`
- `TotalPrice`

## Tools

- Python
- pandas
- openpyxl
- Jupyter Notebook

## Workflow

1. Loaded the raw Excel file.
2. Reviewed dataset shape, columns, and data types.
3. Checked missing values across all columns.
4. Checked duplicate rows and duplicate order IDs.
5. Counted unique customers.
6. Validated business logic: `Quantity x UnitPrice = TotalPrice`.
7. Checked for invalid negative values in numeric fields.
8. Replaced missing `CouponCode` values with `No Coupon`.
9. Re-ran validation checks after cleaning.
10. Exported the cleaned dataset to Excel.

## Cleaning Decisions

### CouponCode

`CouponCode` had `309` missing values.

I treated these as orders where no coupon was used rather than as corrupted records. The values were replaced with:

```text
No Coupon
```

This keeps the rows and preserves a useful category for later analysis.

### Duplicate Records

No duplicate rows were found. `OrderID` values were also unique, which supports treating each row as one order transaction.

### Revenue Validation

The notebook checks whether:

```text
Quantity x UnitPrice = TotalPrice
```

Some direct comparisons appeared mismatched at first because of floating-point precision. After using rounded comparisons, the totals validated correctly.

## Outputs

- Final HTML report: [`reports/project1_data_cleaning_report.html`](reports/project1_data_cleaning_report.html)
- Cleaned dataset: [`cleaned_data/cleaned_dataset.xlsx`](cleaned_data/cleaned_dataset.xlsx)
- Notebook: [`notebook/data_cleaning.ipynb`](notebook/data_cleaning.ipynb)

## Visuals

No charts were exported for this project. That was intentional: the work is focused on data validation and cleaning decisions. The visual analysis starts in Project 2 after the dataset has been checked.

## Project Structure

```text
Project-1-Data-Cleaning/
|-- README.md
|-- requirements.txt
|-- data/
|   |-- Dataset for Data Analytics.xlsx
|-- notebook/
|   |-- data_cleaning.ipynb
|-- cleaned_data/
|   |-- cleaned_dataset.xlsx
|-- reports/
|   |-- project1_data_cleaning_report.html
```

## How to View or Run

For a quick review, open the HTML report:

[`reports/project1_data_cleaning_report.html`](reports/project1_data_cleaning_report.html)

To run the notebook locally:

```bash
pip install -r requirements.txt
jupyter notebook notebook/data_cleaning.ipynb
```

## Limitations

- The dataset is already fairly clean, so the project is more about validation discipline than complex cleaning.
- Missing coupon values are interpreted as no coupon usage, which is reasonable for this dataset but would need confirmation from a data owner in a real business setting.
- The dataset does not include costs, discounts, return reasons, or delivery timestamps, so this cleaning project does not validate profitability or fulfillment outcomes.

## Technical Summary

This project demonstrates a basic but important analytics habit: verify the data before analyzing it. The cleaned file is used as a reliable starting point for the later EDA project.
