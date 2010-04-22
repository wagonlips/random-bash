#! /bin/bash
find /media/moviebox/ -type d -exec chmod 775 {} \;
find /media/moviebox/ -type f -exec chmod 664 {} \;
