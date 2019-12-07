#!/usr/bin/env bash

# --------------------------------------------------------------------
# Publishes a small test site that uses the packages/web3/dist/min
# --------------------------------------------------------------------

if [ -z "$CI" ]; then

  echo "======================================================================"
  echo "This script publishes a test site with surge.sh. Only run in CI."
  echo "======================================================================"

  exit 1

fi

echo "======================================================================"
echo "Publishing test site with surge.sh. See link below.                   "
echo "======================================================================"

cp packages/web3/dist/web3.min.js scripts/html
cd scripts
(echo "" && exit && cat ) | npx surge html

# Might be running locally in development
rm html/web3.min.js

# Script doesn't always work...
exit 0