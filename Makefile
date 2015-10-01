#!/usr/bin/make -f
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

TESTDIR=testing
TMPDIR=/tmp
MANDIR=man
HOME_FADECUT=${HOME}/.fadecut

all:
	@echo Building manpage from fadecut.1.md
	pandoc -s -t man $(MANDIR)/fadecut.1.md -o $(MANDIR)/fadecut.1

test: prepare
	if [ -d "$(TESTDIR)" ]; then \
	  cd $(TESTDIR); \
	  ./fctest; \
	fi

clean:
	find $(TESTDIR)/testdir/ -name "*.mp3" -delete
	find $(TESTDIR)/testdir/ -name "*.ogg" -delete
	find $(TESTDIR)/testdir/ -name "*.opus" -delete

	if [ -f "$(TMPDIR)/fadecut_${LOGNAME}.tar" ]; then \
	  cd /; \
	  tar xfv $(TMPDIR)/fadecut_${LOGNAME}.tar; \
	  rm $(TMPDIR)/fadecut_${LOGNAME}.tar; \
	  echo fadecut-home is restored; \
	fi

	if [ -f "$(MANDIR)/fadecut.1" ]; then \
	  echo remove $(MANDIR)/fadecut.1; \
	  rm $(MANDIR)/fadecut.1; \
	fi

prepare:
	if [ -d "$(HOME_FADECUT)" ]; \
	then \
	  if tar cfv $(TMPDIR)/fadecut_${LOGNAME}.tar $(HOME_FADECUT); \
	  then \
	    rm -rf $(HOME_FADECUT); \
	    echo Auto-testing is prepared; \
	  fi \
	fi
