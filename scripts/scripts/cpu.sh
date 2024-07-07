#!/bin/bash
ps -e -o %cpu | awk '{s+=$1} END {printf("%.1f%%\n", s/8)}'
