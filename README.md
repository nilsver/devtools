# Devtools

This project provides tools for automating RPM repository management.

## Installing devtools

### 1. Clone the repository
First, clone the repository and navigate into the project directory:

```bash
git clone https://github.com/nilsver/devtools.git
cd devtools
```
### 2. Build the RPM
To build the RPM package, run the following command:

```bash
./build.sh
```
### 3. Install the rpm
Once the RPM is built, you can install it using yum or dnf:

```bash
sudo yum localinstall devtools-1.0-1.x86_64.rpm
```
### 4. Set up your environment
After installation, you need to configure your environment by running:

```bash
sudo setup_devtools.sh
```
This will prompt you to enter a USERNAME and the PACKAGE_DIR for your RPMs. The settings will be saved in the /usr/local/bin/.env file.

## Usage
After installation and environment setup, you can use the following commands to manage your RPM repository:

- rb_copy_to_repo – Copy RPMs to the repository directory.
- rb_clean_repo – Clean RPMs from the repository.
- rb_show_repo – Show the overview of the RPM repository.

## Contributing
Contributions are welcome! Feel free to fork the repository and submit pull requests with improvements, bug fixes, or new features.
