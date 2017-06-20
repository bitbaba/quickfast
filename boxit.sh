#!/bin/bash

#Note: build on ubuntu12.04 x86, with gcc/g++(version4.6.3)

# Command file to set QuickFAST environment
# QuickFAST depends on MPC V 3.6 or later. (http://www.ociweb.com/products/mpc)
# QuickFAST depends on BOOST V 1.36.0 or later. (http://www.boost.org/)
# QuickFAST depends on Xerces V3.0 or later. (http://xerces.apache.org/xerces-c/)
# Customize this file by setting variables to suit your environment
BUILD_DIR=~/workspace/built

export QUICKFAST_ROOT=$(dirname $(readlink -f $0))

export MPC_ROOT=$BUILD_DIR/MPC-MPC_4_1_2

export BOOST_ROOT=$BUILD_DIR
# Note: Makefile request for `$BOOST_ROOT/include/$BOOST_VERSION', use `.' to make it work
export BOOST_VERSION="."

# Note: Bug in `src/Makefile.QuickFast', it use `XERCESCROOT' instead of `XERCES_ROOT' 
export XERCESCROOT=$BUILD_DIR
#export XERCES_ROOT=$QUICKFAST_ROOT/out
#export XERCES_LIBPATH=$QUICKFAST_ROOT/out/lib
#export XERCES_LIBNAME=$QUICKFAST_ROOT/out/xerces-c-3.1
#export XERCES_INCLUDE=$QUICKFAST_ROOT/out/include

source ./setup.sh && source ./m.sh 

make && \
./bin/QuickFASTTest 
