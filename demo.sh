#!/bin/bash
# script to demostrate how nexpnr exits with error condition when last line
# of a non-linux format lpf file is blank.

# install tools that converts between CRLF (DOS) and LF (unix)
# sudo apt-get install dos2unix

# make our lpf file a unix-flavored line delimiter; errors do no occur

# build, showing success
echo -e "\n\nTesting non-error condition..."

rm working.log
rm error.log

dos2unix ulx3s_v20.lpf
make clean     >  working.log 2>&1
make ulx3s.bit >> working.log 2>&1
cat working.log | grep -i error

# make our lpf file a Windows/DOS flavored line delimiter; errors occur when last line is blank

# build again, showing error
echo -e "\n\nTesting error condition..."
unix2dos ulx3s_v20.lpf
make clean     >  error.log 2>&1
make ulx3s.bit >> error.log 2>&1
cat error.log | grep -i error


echo -e "\n"
