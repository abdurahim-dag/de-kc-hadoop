#!/usr/bin/env python
"""mapper.py"""

import sys
import re

def perform_map():
    for line in sys.stdin:
        line = line.strip()
        trip = line.split(',')
        m = re.search('(\d\d\d\d-\d\d)', trip[1])
        month = m.group(0)
        payment_type = trip[9]

            print('%s\t%s' % (word, 1))


if __name__ == '__main__':
    perform_map()
