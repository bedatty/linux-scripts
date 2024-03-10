# Terraform Installation and Update

This Bash script automates the process of installing Terraform on Debian-based Linux systems.

## Prerequisites

- A Debian-based Linux operating system (e.g., Ubuntu).

## Usage

1. Clone this repository or download the `./install\&update-terraform.sh` script.
2. In the terminal, navigate to the directory where the script is located.
3. Run the following command to make the script executable (Maybe you will need use `sudo`):

    ```bash
    chmod +x ./install\&update-terraform.sh
    ```

4. Execute the script:

    ```bash
    ./install\&update-terraform.sh
    ```

## Script Details

The script performs the following steps:

1. Updates system packages and installs necessary dependencies for the installation process.
2. Retrieves the HashiCorp signing key and adds it to the system's keyring.
3. Adds the official HashiCorp repository to the system.
4. Updates system packages again and installs Terraform.

## Contributing

If you encounter any issues with the script or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This script is distributed under the [MIT License](https://opensource.org/licenses/MIT).
