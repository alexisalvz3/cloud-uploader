#!/bin/bash

# This CLI tool will allow a user to upload files directly from the CLI to an Amazon S3 bucket.


usage() {
    echo "Usage: $0 <file_path> <s3_bucket_name>"
    echo
    echo "Arguments:"
    echo "  file_path      : Path to the file you want to upload"
    echo "  s3_bucket_name : Name of the S3 bucket to upload to"
    echo
    echo "Example:"
    echo "  $0 /path/to/myfile.txt my-bucket"
}

if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    usage
    exit 1
else
    file_path="$1"
    s3_bucket="$2"
fi

if [ ! -f "$file_path" ]; then
    echo "Error: File does not exist: $file_path"
    exit 1
fi
