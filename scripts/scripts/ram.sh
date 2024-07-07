#!/bin/bash
# echo "$(memory_pressure | rg percentage --color=never | sed 's/System-wide memory free percentage: //g') free"
echo "$(memory_pressure | rg System-wide --color=never | sed "s/System-wide memory free percentage: \([0-9]*\)%/100-\1/" | bc)%"
