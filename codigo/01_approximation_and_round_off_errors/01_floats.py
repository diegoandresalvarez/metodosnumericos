import numpy as np

print("Floating-point information for different data types:")
for dt in [ np.float16, np.float32, np.float64 ]:
   finfo = np.finfo(dt)
   print(f"Data type:          {finfo.dtype}")
   print(f"Bits:               {finfo.bits}")
   print(f"Machine epsilon:    {finfo.eps}")
   print(f"Smallest positive:  {finfo.tiny}")
   print(f"Max:                {finfo.max}")
   print(f"Significant digits: {finfo.precision}")
   print(f"Bits mantissa:      {finfo.nmant}")
   print(f"Bits exponent:      {finfo.nexp}")
   print()

