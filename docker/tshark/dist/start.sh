#!/bin/sh

# Environment Variables
export PCAPOUT="/opt/data/tshark.pcap"

# Remove Existing PCAP, if it exists.
touch $PCAPOUT
rm -rf $PCAPOUT

# Start tshark, logging packets to $PCAPOUT
tshark -w $PCAPOUT
