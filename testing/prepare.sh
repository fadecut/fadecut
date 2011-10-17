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

# --- Constants ----------------------------------------------------------------
. ./config || exit 3
# --- Variables ----------------------------------------------------------------
# --- Main ---------------------------------------------------------------------
retMain=0

touch ${LOCKFILE} || exit 3

if [ -d "${HOME_FADECUT}" ];
then					# if there is already an existing
                                        # fadecut homedir, then safe it
  if tar cf /tmp/fadecut_${LOGNAME}.tar ${HOME_FADECUT};
  then
    rm -rf ${HOME_FADECUT}
    echo "Home backed up and removed"
    retMain=0
  else
    retMain=3
  fi
else
  #retMain=3
  echo "no fadecut homedir, nothing to safe"
fi

exit $retMain
