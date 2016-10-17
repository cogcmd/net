#!/bin/bash

declare -a arguments

if [ "$COG_ARGV_0" == "" ] ; then
    echo "Error: You must supply a hostname or IP address to ping"
fi

if [ "$COG_OPT_COUNT" == "" ] ; then
    arguments+=("-c")
    arguments+=("5")
fi

if [ "$COG_OPT_COUNT" != "" ] ; then
    arguments+=("-c")
    arguments+=("${COG_OPT_COUNT}")
fi

# Set template to use for rendering output
echo "COG_TEMPLATE: ping "

# Run the ping  command. The results will be sent back as individual
# lines and Cog will wrap them in an array under a key named body
# in the response object.
ping  "${arguments[@]}" "$COG_ARGV_0"
