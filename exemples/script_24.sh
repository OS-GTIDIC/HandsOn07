#!/bin/bash
ls -lh > listing.txt                    # stdout to file
cat < script_23.sh                      # file to stdin
grep date * 2> err.log                  # stderr to a file
grep date * 1>&2                        # stdout to stderr
cat "$(find ./ -name file_names)" 2> /dev/null    # shows files named 'f' and delete stderr
exit 0
