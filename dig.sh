#!/bin/bash

declare -a arguments

if [ "$COG_ARGV_0" == "" ] ; then
    echo "Error: You must supply a name to be resolved in DNS"
fi

if [ "$COG_OPT_SHORT" == "true" ] ; then
    arguments+=("+short")
fi

if [ "$COG_OPT_TRACE" == "true" ] ; then
    arguments+=("+trace")
fi

if [ "$COG_OPT_TYPE" != "" ] ; then
    arguments+=("-t")
    arguments+=("${COG_OPT_TYPE}")
fi

if [ "$COG_OPT_SERVER" != "" ] ; then
    arguments+=("@${COG_OPT_SERVER}")
fi

echo "COG_TEMPLATE: dig"
dig "${arguments[@]}" "$COG_ARGV_0"
