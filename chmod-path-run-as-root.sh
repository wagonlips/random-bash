#! /bin/bash

# chmod-path-run-as-root

# Check for proper number of command line args.

EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` /full/path/to/files"
  exit $E_BADARGS
fi

find $1 -type f -exec chmod 664 {} \;
find $1 -type d -exec chmod 775 {} \;

exit 0
