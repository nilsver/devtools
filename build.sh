#!/bin/bash
# Build script for devtools

if ! command -v rpmbuild &> /dev/null; then
  echo "Error: 'rpmbuild' is not installed."
  echo "Please install 'rpmbuild' using your package manager (e.g., 'dnf install rpm-build')."
  exit 1
fi

mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

cp specs/devtools.spec ~/rpmbuild/SPECS/
cp scripts/* ~/rpmbuild/SOURCES/
cp setup_devtools.sh ~/rpmbuild/SOURCES/

rpmbuild -bb ~/rpmbuild/SPECS/devtools.spec

if [ $? -eq 0 ]; then
  echo "RPM built successfully. Find it in ~/rpmbuild/RPMS/x86_64/"
else
  echo "Error occurred during RPM build."
  exit 1
fi
