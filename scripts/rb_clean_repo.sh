#!/bin/bash

echo "${BLUE}Cleaning directory: ${GREEN}$PACKAGE_DIR${NC}"

if [ -d "$PACKAGE_DIR" ]; then
  
  echo -e "${RED}Removing RPM files in $PACKAGE_DIR/SRPMS except those starting with $USERNAME...${NC}"
  find "$PACKAGE_DIR/SRPMS" -type f -name "*.rpm" ! -name "${USERNAME}*" -exec rm -f {} \;
  
  echo -e "${RED}Removing RPM files in $PACKAGE_DIR/x86_64 except those starting with $USERNAME...${NC}"
  find "$PACKAGE_DIR/x86_64" -type f -name "*.rpm" ! -name "${USERNAME}*" -exec rm -f {} \;
  
  echo -e "${GREEN}Updating repository metadata for SRPMS...${NC}"
  createrepo --update "$PACKAGE_DIR/SRPMS"
  
  echo -e "${GREEN}Updating repository metadata for x86_64...${NC}"
  createrepo --update "$PACKAGE_DIR/x86_64"

echo -e "${BLUE}Cleaning completed.${NC}"
else
  echo "Directory $PACKAGE_DIR does not exist. Exiting."
fi