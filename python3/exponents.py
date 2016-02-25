#!/usr/bin/env python3

from itertools import count

MAX =       30
MAX_VALUE = 1000

for i in range(2, MAX+1):
    print("Exponents of {0:3d}:".format(i))

    # Compute all exponents smaller than MAX_VALUE
    counter = count(start=1)
    exponents = [i**next(counter)]
    while exponents[-1] <= MAX_VALUE:
        exponents.append(i**next(counter))
    exponents.pop()
    
    # Print divisible
    for div in range(2, MAX+1):
        divisibles = [x for x in exponents if x%div==0]
        if len(divisibles) > 0:
            divisibles_string = "".join("{0:4d},".format(x) for x in divisibles)
            print("  Divisible by {0:3d}: ".format(div) + divisibles_string)
