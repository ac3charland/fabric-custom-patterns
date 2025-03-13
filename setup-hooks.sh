#!/bin/bash

# Get the absolute path to the repository
REPO_PATH=$(git rev-parse --show-toplevel)

# Configure Git to use the .hooks directory for this repository
git config core.hooksPath .hooks

echo "Git hooks have been configured for this repository."
echo "The post-commit hook will copy patterns to ~/.config/fabric/patterns when committing to main."
