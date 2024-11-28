#!/bin/bash

echo -e "${BLUE}Overview of the packages in ${GREEN}$PACKAGE_DIR:${NC}"
echo ""
echo -e "${RED}SRPMS:${NC}"
find "$PACKAGE_DIR/SRPMS" -type f -name "*.rpm" -printf "${GREEN}%f\n${NC}"
echo ""
echo -e "${RED}x86_64:${NC}"
find "$PACKAGE_DIR/x86_64" -type f -name "*.rpm" -printf "${GREEN}%f\n${NC}"