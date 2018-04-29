#!/bin/bash
find /media/backup2011/ ! -readable -prune -o -name .DS_Store -exec rm {} +
find /media/backup20131003/ ! -readable -prune -o -name .DS_Store -exec rm {} +

