#!/bin/sh

umask 077

readonly request_english='http://roosters.saxion.nl/lang/eng'
readonly timetable='http://roosters.saxion.nl/schedule/group:EEL1I'

readonly outfile='/media/b/times.txt'

mount /dev/sdb
wget -O - $request_english $timetable | elinks -dump -dump-charset ASCII -no-numbering -no-references | sed -n '/Monday/,/Previous/{p}' | unix2dos > $outfile
umount /dev/sdb
