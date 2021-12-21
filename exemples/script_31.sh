#!/bin/bash
echo -e "Jon\nArya\nJaime\nDaenerys\nAerys\nNed" > file1
sort file1 > file1_sorted
echo -e "10\n8\n1\n2\n40\n15" > file2
sort -n file1 > file2_sorted; sort -nr file1 > file_rsorted
echo -e "got.loc.Winterfell\ngot.loc.Quarth\ngot.loc.Riverrun\ngot.loc.Casterly Rock" \
        "\ngot.loc.Pyke\ngot.loc.King's Landing" > file3
sort -t'.' -k3 file3 > file3_sorted
exit 0
