#!/bin/bash 
source ./setup.sh && source ./m.sh && make -j $MAKEJOBS && ./bin/QuickFASTTest && cp -rfL bin lib $BUILD_DIR/
