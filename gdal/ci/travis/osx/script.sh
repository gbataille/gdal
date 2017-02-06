#!/bin/sh

set -e

cd gdal
# CPP unit tests
cd ../autotest
cd cpp
GDAL_SKIP=JP2ECW make quick_test >/dev/null 2>&1
cd ..
# Run all the Python autotests
#make -j test
python run_all.py
flake8 gdal/swig/python/scripts/gdal2tiles.py
pylint gdal/swig/python/scripts/gdal2tiles.py
