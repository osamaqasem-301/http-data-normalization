# HTTP Status Code Normalization

**Author:** Osama Qasem

## Description

This Bash solution reads a text excerpt of the IANA HTTP Status Code Registry and transforms individual HTTP status code entries into line-oriented CSV records. It filters headings and unassigned ranges, trims whitespace, and outputs `Code,Description,Reference` fields to standard output.

Source: https://www.iana.org/assignments/http-status-codes

## Requirements

A Linux shell with Bash, `make`, `zip`, and Git (Git is needed only for deployment).

## Run the solution

```sh
bash normalize.sh raw_data.txt > result.csv
cat result.csv
```

The sample input is `raw_data.txt`. `normalized.csv` and `normalized.txt` are included example outputs.

## Build and deploy

From inside the project directory (which must be part of your **class Git repository**):

```sh
make help       # Print author and usage instructions (also the default 'make' action)
make build      # Bundle script, input, example output, and README into a ZIP
make deploy     # Build ZIP, then stage and commit ZIP in the current Git repository
```

The deployment package is named `http-normalization-deployment.zip`. `make deploy` commits locally; to publish to GitHub, run `git push` with the appropriate remote and branch. Configure Git author name/email and make sure you are in the intended class repository before deploying. Re-running `make deploy` without changed package contents may report that there is nothing new to commit.

## Limitations

The parser expects one record per line with pipe separators (`|`); it skips ranges and does not escape double quotes embedded in CSV fields. It is tailored to the supplied sample text rather than arbitrary web-page layouts.
