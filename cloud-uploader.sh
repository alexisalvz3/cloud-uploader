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

# check if correct number of arguments are passed

if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    usage
    exit 1
else
    file_path="$1"
    s3_bucket="$2"
fi

# check if file path does exist

if [ ! -f "$file_path" ]; then
    echo "Error: File does not exist: $file_path"
    exit 1
fi

# check if AWS CLI is installed on the system

if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI is not installed or not in PATH"
    echo "Please install AWS CLI and make sure it's in your PATH"
    exit 1
fi

# If we get here, AWS CLI is installed
aws_version=$(aws --version 2>&1)
echo "Using AWS CLI: $aws_version"

# check if AWS CLI is configured by trying to list s3 buckets

if ! aws s3 ls &> /dev/null; then
    echo "Error: AWS CLI is not configured correctly"
    echo "Please run 'aws configure' to set up your AWS credentials"
    exit 1
fi

# actual file upload process

# pipe the output to a while loop that continuously updates the same line
aws s3 cp "$file_path" "s3://$s3_bucket/$(basename "$file_path")" --progress 2>&1 | {
    while IFS= read -r line; do
        echo -ne "\r$line"
    done
    echo
}
exit_status=${PIPESTATUS[0]}

if [ $exit_status -eq 0 ]; then
    echo "Successfully uploaded $file_path to s3://$s3_bucket/$(basename "$file_path")"
else
    echo "Failed to upload file. Please check your AWS configuration and try again."
    exit 1
fi