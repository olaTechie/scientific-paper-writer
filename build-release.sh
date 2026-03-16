#!/usr/bin/env bash
set -euo pipefail

VERSION=$(grep '"version"' .claude-plugin/plugin.json | sed 's/.*: "\(.*\)".*/\1/')
RELEASE_NAME="scientific-paper-writer-v${VERSION}"
DIST_DIR="dist"

echo "Building ${RELEASE_NAME}..."

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}/scientific-paper-writer"

rsync -a \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='dist' \
  --exclude='docs' \
  --exclude='manuscript' \
  --exclude='node_modules' \
  . "${DIST_DIR}/scientific-paper-writer/"

cd "${DIST_DIR}"
zip -r "${RELEASE_NAME}.zip" scientific-paper-writer/
cd ..

echo "Release built: ${DIST_DIR}/${RELEASE_NAME}.zip"
