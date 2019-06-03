
# DLL load failed

```
-> 45 from . import _arpack
     46 import numpy as np
     47 import warnings

ImportError: DLL load failed: 找不到指定的程序。
```
Solution:`pip install mkl`