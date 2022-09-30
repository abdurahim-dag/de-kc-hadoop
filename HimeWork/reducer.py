#!/usr/bin/env python
"""reducer.py"""

import sys
from decimal import Decimal


def perform_reduce():
    total_amount_sum = 0
    count = 1
    payment_type_current = None
    month_current = None
    payment_type = None
    month = None
    combine= None

    for line in sys.stdin:
        line = line.strip()
    #    print(line)
    #     continue
    #     #combine, total_amount = line.split(".", 1)


        try:
            key, value = line.split('\t',1)
            month, payment_type = key.split(",", 1)
            total_amount = Decimal(value)
        except ValueError:
            continue

        if month == month_current and payment_type == payment_type_current:
            total_amount_sum += total_amount
            count += 1
        else:
            if month_current or payment_type_current:
                print(
                    "%s,%s,%s"
                    % (
                        month_current,
                        payment_type_current,
                        total_amount / count,
                    )
                )
            month_current = month
            payment_type_current = payment_type
            total_amount_sum = total_amount
            count = 1

    if month == month_current and payment_type == payment_type_current:        
        print("%s,%s,%s" % (month_current, payment_type_current, total_amount / count))


if __name__ == "__main__":
    perform_reduce()
