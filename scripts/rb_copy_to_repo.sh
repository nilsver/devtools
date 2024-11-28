#!/bin/bash

# Default path
pkg_path="packaging/rpm/pkgs"

shopt -s nullglob

src_rpm_files=($pkg_path/*.src.rpm)
noarch_rpm_files=($pkg_path/*.noarch.rpm)
x86_64_rpm_files=($pkg_path/*.x86_64.rpm)

echo -e "${BLUE}Source RPM files:${NC} ${GREEN}${src_rpm_files[@]}${NC}"
echo -e "${BLUE}Noarch RPM files:${NC} ${GREEN}${noarch_rpm_files[@]}${NC}"
echo -e "${BLUE}x86_64 RPM files:${NC} ${GREEN}${x86_64_rpm_files[@]}${NC}"

echo -e "${RED}Starting to copy source RPM files...${NC}"
for file in "${src_rpm_files[@]}"; do
  echo -e "${GREEN}Copying $file to $PACKAGE_DIR/SRPMS${NC}"
  cp "$file" "$PACKAGE_DIR/SRPMS/"
done

echo -e "${RED}Starting to copy noarch RPM files...${NC}"
for file in "${noarch_rpm_files[@]}"; do
  echo -e "${GREEN}Copying $file to $PACKAGE_DIR/x86_64${NC}"
  cp "$file" "$PACKAGE_DIR/x86_64/"
done

echo -e "${RED}Starting to copy x86_64 RPM files...${NC}"
for file in "${x86_64_rpm_files[@]}"; do
  echo -e "${GREEN}Copying $file to $PACKAGE_DIR/x86_64${NC}"
  cp "$file" "$PACKAGE_DIR/x86_64/"
done

echo -e "${GREEN}Updating repository metadata for SRPMS...${NC}"
createrepo --update "$PACKAGE_DIR/SRPMS"
  
echo -e "${GREEN}Updating repository metadata for x86_64...${NC}"
createrepo --update "$PACKAGE_DIR/x86_64"

echo -e "${BLUE}Copying completed.${NC}"
