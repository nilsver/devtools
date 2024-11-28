Name: devtools
Version: 1.0
Release: 1
Summary: Devtools package
License: GPL
BuildRequires: bash

%description
This package provides development tools.

Source0: rb_clean_repo
Source1: rb_clean_repo.sh
Source2: rb_copy_to_repo
Source3: rb_copy_to_repo.sh
Source4: rb_show_repo
Source5: rb_show_repo.sh
Soruce6: setup_devtools.sh

%prep

%build

%install
mkdir -p %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_copy_to_repo.sh %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_clean_repo.sh %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_show_repo.sh %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_copy_to_repo %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_clean_repo %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/rb_show_repo %{buildroot}/usr/local/bin
install -m 755 %{_sourcedir}/setup_devtools.sh %{buildroot}/usr/local/bin

%post
read -p "Enter USERNAME: " USERNAME
echo "USERNAME=$USERNAME" > /usr/local/bin/.env
read -p "Enter locations for the packages (ex. /mnt/devel/rhel/9/): " PACKAGE_DIR
echo "PACKAGE_DIR=$PACKAGE_DIR" >> /usr/local/bin/.env

%files
/usr/local/bin/rb_copy_to_repo
/usr/local/bin/rb_clean_repo
/usr/local/bin/rb_show_repo
/usr/local/bin/rb_copy_to_repo.sh
/usr/local/bin/rb_clean_repo.sh
/usr/local/bin/rb_show_repo.sh
/usr/local/bin/setup_devtools.sh
