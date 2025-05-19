#!/bin/sh

gawk -F'|' \
     'BEGIN  { sum = 0 }
             { sum = sum + $5 }
      END    { print sum }' \
     "$1"
