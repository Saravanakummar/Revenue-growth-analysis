# Reorganization Guide

## Purpose
This guide provides instructions for renaming files to standardize the naming convention.

## Naming Convention
1. **Use lowercase letters** for all filenames.
2. **Use hyphens (-)** to separate words (e.g., `project-file.md` instead of `ProjectFile.md`).
3. **Be descriptive.** The filename should reflect the content of the file.

## Steps to Rename Files
1. Open your terminal or command prompt.
2. Navigate to the directory of the repository.
3. Use the `mv` command to rename files.
   - Example: `mv OldFileName.md new-file-name.md`
4. Verify the rename by listing the files in the directory with `ls`.
5. Commit the changes:
   ```bash
   git add .
   git commit -m "Standardize naming convention for files"
   git push
   ```

## Conclusion
Following this guide will help in standardizing file naming within the repository, making it easier to locate and manage files.