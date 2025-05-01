#!/bin/bash
# Example wrapper script for diffing binary files
hexdump $1 > /tmp/$1.hex
hexdump $2 > /tmp/$2.hex
diff /tmp/$1.hex /tmp/$2.hex
rm /tmp/$1.hex /tmp/$2.hex

