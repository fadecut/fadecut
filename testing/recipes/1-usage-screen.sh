#!/bin/bash

# Is usage screen there?
./fadecut | grep usage &>/dev/null || exit $?
