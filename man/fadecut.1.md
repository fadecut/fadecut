% fadecut(1)
% Martin Gafner, Marco Balmer
% March 2013

## NAME

fadecut - Toolset to rip audiostreams, cut, fade in/out and tag the
resulting audiofiles

## SYNOPSIS

    fadecut -p <profile> [ OPTIONS ]

# DESCRIPTION

fadecut is a script to rip audio files from a livestream (using stream-
ripper) and to process them automatically. Beginning and ending fo the
audio files will be cut and faded in/out. So logos and advertising of
radio stations will be automatically removed.

In streaming mode fadecut is ripping audio files using streamripper. The
downloaded audio files are cutted using silence detection and then faded
in and out. Subsequently, the files are encoded to either ogg or mp3 and
tagged with tags (title, artist, genre and comment provided).

In file mode fadecut is just processing already ripped audio files.

An audio file which has already been processed is detected and will not
be processed again. Not desired songs can be stored in a separate
directory. This files are not processed anymore too.

# FOLDERS

fadecut is working with some standard folders. You may change them in
your profile or fadecutrc

**done/** here you put all your songs which were already processed by fadecut and which you want to keep. See also new/ folder.

**dontlike/** in this folder you may put songs which you don't like.  Fadecut  is  checking  this folder before it is processing new files in the working folder. Null size files are ok.

**error/** whenever an error occurs while fadecut  is  processing  a  file, that file is moved to the error folder for later examining.

**incomplete/**  this  folder  is  created  by  streamripper. All not fully ripped songs are saved here.

**new/** processed songs are going here. Usually you may  rip  and  process files  with  fadecut,  they  are going in to new/ folder, you listen to them and put good songs to the done/ folder.

**orig/** if you want to keep the original file (which is ripped by stream-ripper), you may use the -k option. fadecut is putting the ripped files untouched into that folder.

# OPTIONS

-c Create a new profile <profilename>

-e Edit an existing profile <profilename>

-l list all existing profiles

-i optional input <directory>

-o optional output <directory>

-k optional to keep the untouched original song in the /orig folder

-d Debug: -d 0|1|2|3 (level 0 is standard, -d without number is like 1)

-h Show this message

-p Profile <profilename>

-q Quiet

-r Stream (and rip), start streamripper

-v Verbose

# VARIABLES

URL to stream

	STREAM_URL="http://streamurl"

Preferred destination fileformat. (opus/ogg/mp3)

	ENCODING=ogg

Processed files will get the above genre.

	GENRE="SwissPop"

Processed files will get the above comment.

	COMMENT="Radio Swiss Pop"

Cut <n> seconds off the file in the beginning.

	TRIM_BEGIN=0

Cut <n> seconds off the file at the end.

	TRIM_END=0

Fade in for <n> seconds.

	FADE_IN=1

Fade out for <n> seconds.

	FADE_OUT=4

Set the user-agent used by streamripper

	USER_AGENT="Streamripper/1.x"

# EXAMPLES

Create a new ripping profile

	fadecut -c test

Edit/update profile test

	fadecut -e test

Rip, cut and fade in-/out with profile test

	fadecut -p test -r

Only cut and fade in-/out without ripping from livestream

	fadecut -p test

# SEE ALSO

id3v2(1), oggenc(1), opusenc(1), sox(1), streamripper(1), lame(1)

# FILES

The main fadecut configuration file, executed with every start of
fadecut

*\~/.fadecut/fadecutrc* is the main fadecut configuration file, executed
with every start of fadecut.

*\~/.fadecut/statslog.csv* is the statistics file.

*\~/.fadecut/profiles* is the folder where all profiles are located.

# RESOURCES

fadecut git website: https://github.com/micressor/fadecut

