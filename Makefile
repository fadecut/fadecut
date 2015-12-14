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

PN		= fadecut

PREFIX		?= /usr
BINDIR		= $(PREFIX)/bin
DOCDIR		= $(PREFIX)/share/doc/$(PN)
MAN1DIR		= $(PREFIX)/share/man/man1
TESTINGDIR	= testing
HOME_FADECUT	= ${HOME}/.fadecut

all:
	@echo Building manpage from fadecut.1.md
	pandoc -s -t man man/fadecut.1.md -o man/fadecut.1

test:
	if [ -d "$(TESTINGDIR)" ]; then \
	  cd $(TESTINGDIR); \
	  ./fctest; \
	fi

clean:
	find $(TESTINGDIR)/testdir/ -name "*.mp3" -delete
	find $(TESTINGDIR)/testdir/ -name "*.ogg" -delete
	find $(TESTINGDIR)/testdir/ -name "*.opus" -delete

	if [ -f "man/fadecut.1" ]; then \
	  echo remove man/fadecut.1; \
	  rm man/fadecut.1; \
	fi

install-bin:
	@echo 'installing main script...'
	install -Dm755 $(PN) "$(DESTDIR)$(BINDIR)/$(PN)"

install-man:
	@echo 'installing manpages...'
	install -Dm644 man/$(PN).1 "$(DESTDIR)$(MAN1DIR)/$(PN).1"

install-doc:
	@echo 'installing documentation...'
	install -Dm644 README.md "$(DESTDIR)$(DOCDIR)/README.md"
	install -Dm644 NOTES.md "$(DESTDIR)$(DOCDIR)/NOTES.md"
	install -Dm644 TODO.md "$(DESTDIR)$(DOCDIR)/TODO.md"
	gzip -9 "$(DESTDIR)$(DOCDIR)/README.md"
	gzip -9 "$(DESTDIR)$(DOCDIR)/NOTES.md"
	gzip -9 "$(DESTDIR)$(DOCDIR)/TODO.md"

install: all install-bin install-man install-doc
