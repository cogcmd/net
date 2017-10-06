#!/bin/bash

declare -a arguments

if [ "$COG_ARGV_0" == "" ] ; then
    echo "Error: You must supply a hostname or IP address to nslookup "
    exit 1
elif [ "$COG_OPT_SERVER" != "" ] ; then
    arguments+=("${COG_OPT_SERVER}")
fi

# Set template to use for rendering output
echo "COG_TEMPLATE: nslookup"

# Run the nslookup   command. The results will be sent back as individual
# lines and Cog will wrap them in an array under a key named body
# in the response object.
nslookup "$COG_ARGV_0" "${arguments[@]}"
