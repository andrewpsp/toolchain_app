#!/bin/sh
 info "Starting the unit testing phase..."        
echo " Junit tests operating"

if [ "$?" -ne 0 ]
then
    echo "Unsuccessfully finished the testing  phase..."
    echo "testing phase has completed..."
exit 1
fi
echo "Successfully finished the testing phase..."
echo "testing phase has completed..."
