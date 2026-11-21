HTTP Status Code Normalization - Part 3
Author: Osama Qasem
Source: https://www.iana.org/assignments/http-status-codes

FILES
normalize.sh             Bash normalization script
raw_data.txt             Continuous visible-text excerpt from IANA registry
normalized.csv           20 structured CSV records
normalized.txt           Same processed text, also saved as .txt
terminal_screenshot.png  Terminal-style capture of actual script output
assignment_comments.txt  Ready-to-paste assignment comments (add repository URL)

RUN ON LINUX
chmod +x normalize.sh
./normalize.sh raw_data.txt > normalized.csv
cat normalized.csv

The script reads the file named on the command line and writes CSV to stdout.
