#!/bin/bash

# Set working directory
cd /tmp/extensions/diffoctreerast|| exit 1

# Ensure pip and setuptools are up to date
# pip install --upgrade pip setuptools wheel

# Extract package version
VERSION=$(python3 setup.py --version)
echo "Detected version: $VERSION"

# Find the built wheel file safely (pick first file if multiple exist)
WHEEL_FILE=$(find dist -name "*.whl" | head -n 1)

# Ensure a wheel was found
if [[ -z "$WHEEL_FILE" ]]; then
    echo "Error: No wheel file found in dist/"
    exit 1
else
    echo "Wheel Dir: $WHEEL_FILE"
fi

# Extract the original wheel name
WHEEL_NAME=$(basename "$WHEEL_FILE")
echo "Wheel File: $WHEEL_NAME"

PACKAGE_NAME="diffoctreerast"
NEW_VERSION="1.0.0"
PYTHON_TAG="cp310"
ABI_TAG="cp310"
PLATFORM_TAG="linux_x86_64"

# Rename it properly
NEW_WHEEL_NAME="${PACKAGE_NAME}-${NEW_VERSION}-${PYTHON_TAG}-${ABI_TAG}-${PLATFORM_TAG}.whl"
echo "Renaming wheel: ${WHEEL_NAME} -> ${NEW_WHEEL_NAME}"

# Ensure /export directory exists
mkdir -p /export

# Copy and rename
cp "$WHEEL_FILE" "/export/${NEW_WHEEL_NAME}"
echo "Wheel copied to /export/${NEW_WHEEL_NAME}"

cd /export/
