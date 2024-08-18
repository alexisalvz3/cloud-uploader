# S3 Uploader

S3 Uploader is a simple command-line tool for uploading files to Amazon S3 buckets. It provides a user-friendly interface with progress feedback and upload statistics.

## Features

- Easy file upload to S3 buckets
- Display of file size before upload
- Progress indicator during upload
- Upload time and speed statistics
- Error handling for common issues

## Prerequisites

- Bash shell
- AWS CLI installed and configured with appropriate credentials
- An S3 bucket to upload to

## Installation

1. Clone this repository or download the `s3_uploader` script.

2. Make the script executable:
  - chmod +x /path/to/your/s3_uploader

3. Create a bin directory in your home folder (if it doesn't exist):
  - mkdir -p ~/bin

4. Create a symbolic link to the script:
  - ln -s /full/path/to/your/s3_uploader ~/bin/s3_uploader

Replace `/full/path/to/your/` with the actual path to the script.

5. Add `~/bin` to your PATH by adding this line to your shell configuration file (`.bashrc`, `.bash_profile`, or `.zshrc`):
  - export PATH="$HOME/bin:$PATH"

6. Reload your shell configuration:
  - source ~/.bashrc  # or .bash_profile, or .zshrc

## Usage

Basic syntax:

s3_uploader <file_path> <s3_bucket_name>

Example:

s3_uploader ~/Documents/myfile.txt my-awesome-bucket

This will upload `myfile.txt` to the S3 bucket named `my-awesome-bucket`.

## Troubleshooting

1. **Command not found**: Ensure that `~/bin` is in your PATH and that you've created the symbolic link correctly.

2. **Permission denied**: Check that the script is executable (`chmod +x s3_uploader`).

3. **AWS CLI errors**: Make sure AWS CLI is installed and configured with the correct credentials.

4. **Bucket not found**: Verify that you've specified the correct bucket name and that you have access to it.

5. **File not found**: Ensure you're providing the correct file path.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.











