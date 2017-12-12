#!/bin/bash

#Note: build on ubuntu12.04 x86, with gcc/g++(version4.6.3)
#Note: use `dpkg-reconfigure dash' to select bash as default shell.

# Command file to set QuickFAST environment
# QuickFAST depends on MPC V 3.6 or later. (http://www.ociweb.com/products/mpc)
# QuickFAST depends on BOOST V 1.36.0 or later. (http://www.boost.org/)
# QuickFAST depends on Xerces V3.0 or later. (http://xerces.apache.org/xerces-c/)
# Customize this file by setting variables to suit your environment

REPO_DIR=$PWD
BUILD_DIR=$REPO_DIR/build

# Make all depends and deploy them into $BUILD_DIR
#make abs_repo_root=$REPO_DIR -f $REPO_DIR/depends/boost-1.64-dyn.mk
make abs_repo_root=$REPO_DIR -f $REPO_DIR/depends/boost-1.64-static.mk
make abs_repo_root=$REPO_DIR -f $REPO_DIR/depends/mpc-4.1.2.mk
make abs_repo_root=$REPO_DIR -f $REPO_DIR/depends/xercesc-3.1.4.mk

# 1) QuickFast
export QUICKFAST_ROOT=$REPO_DIR

# 2) MPC
export MPC_ROOT=$BUILD_DIR/MPC-MPC_4_1_2

# 3) Boost
export BOOST_ROOT=$BUILD_DIR
# Note: Makefile request for `$BOOST_ROOT/include/$BOOST_VERSION', use `.' to make it work
export BOOST_VERSION="."
#export BOOST_CFG="-gcc52-mt"
export BOOST_CFG="-gccunk-mt"

# 4) xerces-c
# Note: Bug in `src/Makefile.QuickFast', it use `XERCESCROOT' instead of `XERCES_ROOT' 
export XERCESCROOT=$BUILD_DIR
#export XERCES_ROOT=$QUICKFAST_ROOT/out
#export XERCES_LIBPATH=$QUICKFAST_ROOT/out/lib
#export XERCES_LIBNAME=$QUICKFAST_ROOT/out/xerces-c-3.1
#export XERCES_INCLUDE=$QUICKFAST_ROOT/out/include

# Build
source ./setup.sh && source ./m.sh && make && ./bin/QuickFASTTest && cp -rfL bin lib $BUILD_DIR/
