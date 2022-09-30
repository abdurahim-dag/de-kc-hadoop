#!/usr/bin/env python
"""mapper.py"""

import sys
import re


def perform_map():
    for line in sys.stdin:
        line = line.strip()
        trip = line.split(",")
        try:
            m = re.search("(\d\d\d\d-\d\d)", trip[1])
            month = m.group(0).strip()
            payment_type = trip[9].strip()
            total_amount = trip[16].strip()
        except:
            continue
        if len(month) > 0 and len(payment_type) > 0 and len(total_amount) > 0:
            print("%s,%s,%s" % (month, payment_type, total_amount))


if __name__ == "__main__":
    perform_map()
