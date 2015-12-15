#!/bin/bash
#
# This file is part of fadecut
# https://github.com/fadecut/fadecut
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
#set -x
echo "--> Script syntax checks"
bash -n $BIN_FADECUT
Ret=$?

if [ $Ret -eq 0 ]; then return 0
fi
#set +x
return 1
}

if ! main; then exit 1
fi
exit 0
