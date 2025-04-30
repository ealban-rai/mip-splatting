#!/bin/bash

# Module to be tested
MODULE_INSTALLED="diffoctreerast"

# Attempt to import the module and check if it works
echo "Testing if '$MODULE_INSTALLED' is installed..."

python3 -c "import $MODULE_INSTALLED; print('✅ Module is installed correctly!')" 2>/dev/null

# Check if the last command was successful
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: '$MODULE_INSTALLED' is NOT installed!"
    # exit 1
else
    echo "🎉 SUCCESS: The module is working!"
fi