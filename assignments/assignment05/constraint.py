#!/usr/bin/env python3

import sys
import datetime

CURRENTDATE = '1995-06-17'

violation = False

with open(sys.argv[1], 'r') as file:
    for line in file:
        receiptdate = datetime.datetime.strptime(line.split('|')[12], '%Y-%m-%d')
        if receiptdate <= datetime.datetime.strptime(CURRENTDATE, '%Y-%m-%d'):
          if line.split('|')[8] != 'R' and line.split('|')[8] != 'A':
            violation = True

with open(sys.argv[1], 'r') as file:
    for line in file:
        receiptdate = datetime.datetime.strptime(line.split('|')[12], '%Y-%m-%d')
        if receiptdate > datetime.datetime.strptime(CURRENTDATE, '%Y-%m-%d'):
          if line.split('|')[8] != 'N':
            violation = True

if violation:
  print("TPC-H constraint violated")
else:
  print("TPC-H constraint satisfied")
