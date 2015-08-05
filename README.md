# Overview / Synopsis

toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles

## long description (english)

fadecut is a script to rip audio files from a livestream and to process them 
automatically. Beginning and ending fo the audio files will be cut and faded 
in/out. So logos and advertising of radio stations will be automatically removed.

In streaming mode fadecut is ripping audio files using streamripper. The 
downloaded audio files are cutted using silence detection and then faded in and 
out. Subsequently, the files are encoded to either ogg or mp3 and tagged with 
tags (title, artist, genre and comment provided).

In file mode fadecut is just processing already ripped audio files.

An audio file which has already been processed is detected and will not be 
processed again. Not desired songs can be stored in a separate directory. This 
files are not processed anymore too.

## long description (german)

Mit fadecut können Audio Dateien aus einem Livestream gerippt und automatisch 
verarbeitet werden. Anfang und Ende der Audiofiles werden geschnitten sowie ein-
und ausgeblendet. Damit können Signete und Werbung von Radiostationen automatisch
entfernt werden.

Im Streaming-Modus startet fadecut den streamripper und lädt damit die Audio 
Data herunter. Die heruntergeladenen Audio Dateien werden dann mittels Silence 
Detection geschnitten sowie ein- und ausgeblendet. Anschliessend werden die 
Dateien wahlweise nach ogg oder mp3 codiert und mit Tags (Titel, Artist, Genre, 
Kommentar) versehen. 

Ein bereits verarbeiteter Song wird erkannt und nicht neu verarbeitet. Nicht 
erwünschte Songs können in einem separaten Verzeichnis abgelegt werden. Diese 
werden dann ebenfalls nicht mehr weiter verarbeitet.

# Requirements

* bash - The GNU Bourne Again SHell

* id3v2 - A command line id3v2 tag editor

* sox - the Swiss army knife of sound processing

* streamripper - download online streams into audio files

* vorbis-tools - several Ogg Vorbis tools

optional, for mp3 encoding:

* lame, An MP3 encoding library (frontend)

# Ubuntu

	apt-get install bash coreutils findutils nice sed sox libsox-fmt-mp3 \
	  streamripper vorbis-tools id3v2

for mp3 encoding:

	apt-get install lame

# Debian

Lame (mp3 encoding) is official not available in debian.

	apt-get vorbis-tools sox libsox-fmt-mp3 streamripper id3v2

## Building Debian packages from source

	cd /tmp
	git clone https://github.com/micressor/fadecut
	cd fadecut
	git checkout debian
	git archive --format=tar --prefix=fadecut-0.X.X/ 0.X.X | gzip > ../fadecut_0.X.X.orig.tar.gz
	dpkg-buildpackage -us -uc
	dpkg -i ../fadecut_*.deb

# Usage 

1. Create a profile file

	fadecut -c myradiostation

Edit variables:

	STREAM_URL="http://streamurl"
	GENRE="Pop"
	COMMENT="Radio station comment"
	FADE_IN=1
	FADE_OUT=4

2. Let's stream, rip and automatically fade & cut now

	fadecut -p myradiostation -r

3. man fadecut

# More useful documentation

You may find it [here.](http://wiki.ubuntuusers.de/fadecut)

### This file is part of fadecut

https://github.com/micressor/fadecut

fadecut is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

fadecut is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with fadecut.  If not, see <http://www.gnu.org/licenses/>.
