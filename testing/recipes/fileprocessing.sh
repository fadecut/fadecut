#!/bin/bash
#
# This file is part of fadecut
# https://github.com/micressor/fadecut
#
# fadecut is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# fadecut is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with fadecut.  If not, see <http://www.gnu.org/licenses/>.

main()
{
TestFolder="$1"
cp "$TestFolder"/../testfiles/test_source/*.mp3 .
mkdir -p "$PROFILEDIR/profiles/"
echo \
"STREAM_URL=\"http://fctest_fileproc_mp3\"
GENRE=\"fadecut testgenre\"
COMMENT=\"fadecut test fileprocessing mp3\"
# all values in seconds:
FADE_IN=1
FADE_OUT=4
TRIM_BEGIN=0
TRIM_END=0" > "$PROFILEDIR/profiles/fctest_fileproc_mp3"
$BIN_FADECUT -p fstest_fileproc_mp3
return 0
}
if ! main; then exit 1
fi
exit 0
