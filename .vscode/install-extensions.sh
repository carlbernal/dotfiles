#!/bin/bash

echo "Installing VS Code extensions..."

while IFS= read -r extension; do
    echo "Installing $extension"
    code --install-extension "$extension"
done <extensions.txt

echo "All extensions installed!"
