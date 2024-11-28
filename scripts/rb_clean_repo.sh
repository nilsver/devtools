#!/bin/bash

echo "${BLUE}Cleaning directory: ${GREEN}$PACKAGE_DIR${NC}"

if [ -d "$PACKAGE_DIR" ]; then
  
  echo -e "${RED}Removing RPM files in $PACKAGE_DIR/SRPMS except those starting with $USERNAME...${NC}"
  find "$PACKAGE_DIR/SRPMS" -type f -name "*.rpm" ! -name "${USERNAME}*" -exec rm -f {} \;
  
  echo -e "${RED}Removing RPM files in $PACKAGE_DIR/x86_64 except those starting with $USERNAME...${NC}"
  find "$PACKAGE_DIR/x86_64" -type f -name "*.rpm" ! -name "${USERNAME}*" -exec rm -f {} \;
  
echo -e "${BLUE}Cleaning completed.${NC}"
else
  echo "Directory $PACKAGE_DIR does not exist. Exiting."
fi