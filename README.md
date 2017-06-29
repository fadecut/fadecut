# Introduction

toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles

## English

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

## German

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

# Installation

## Prerequisites

* bash - The GNU Bourne Again SHell

* id3v2 - A command line id3v2 tag editor

* sox - the Swiss army knife of sound processing

* streamripper - download online streams into audio files

* opus-tools - several Opus tools

* vorbis-tools - several Ogg Vorbis tools

optional, for mp3 encoding:

* lame, An MP3 encoding library (frontend)

## Instructions

### Ubuntu

	apt-get install fadecut

### Debian

	apt-get install fadecut

### From source

	cd ~/
	git clone https://github.com/fadecut/fadecut.git
	cd fadecut
	sudo make install

Have a look at [README.Debian.md](https://github.com/fadecut/fadecut/blob/master/README.Debian.md) for building debian packages.

## Usage

Create a profile file

	fadecut -c myradiostation

Edit variables:

	STREAM_URL="http://streamurl"
	GENRE="Pop"
	COMMENT="Radio station comment"
	FADE_IN=1
	FADE_OUT=4

Let's stream, rip and automatically fade & cut now

	fadecut -p myradiostation -r

	man fadecut

## Useful links

* Fadecut at [ubuntuusers.de](http://wiki.ubuntuusers.de/fadecut)
* [Notes.md](https://github.com/fadecut/fadecut/blob/master/NOTES.md)

# License

fadecut is free software, available under the [GNU General Public License, Version 3](http://www.gnu.org/licenses/gpl.html).
