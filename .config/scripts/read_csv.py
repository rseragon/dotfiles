#!/bin/python
import pandas as pd
import sys

df = pd.read_csv(sys.argv[1])
print(df.head(int(sys.argv[2]) if len(sys.argv) > 2 else 5))
