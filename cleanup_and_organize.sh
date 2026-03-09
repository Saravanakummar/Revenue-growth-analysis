#!/bin/bash

# Cleanup Script for Revenue Growth Analysis Repository

# Standardize naming conventions
find . -iname '*temp*' -exec rename 's/temp/temporary/' {} +
find . -iname '*old*' -exec rename 's/old/obsolete/' {} +

# Add missing files if they don't exist
if [ ! -f .gitignore ]; then
    echo '*.log' >> .gitignore
    echo 'node_modules/' >> .gitignore
    echo 'dist/' >> .gitignore
fi

if [ ! -f LICENSE ]; then
    echo 'MIT License' > LICENSE
fi

# Reorganize files (example: moving temp folders to archive)
mkdir -p archive
mv temp/* archive/ 2>/dev/null

# Cleanup: remove empty directories
find . -type d -empty -delete

# Print completion message
echo 'Cleanup and organizational tasks completed.'