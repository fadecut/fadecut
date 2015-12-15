# useful info

to change tags you may use lltag (writes only id3v1 tags):

	lltag --yes -g SwissPop -c "Radio Swiss Pop" *.mp3

to change filenames according to tags:

	lltag --rename "%a_-_%t" --rename-min --rename-sep _ --yes *.mp3

to change filenames with iso-8859 umlaut to utf8:

	convmv -f iso-8859-15 -t utf8 -r *.mp3 --notest

another command line tagging tool, which reads and writes also id3v2:
(and it is able to write lyrics and pictures into the files)
(not useful for reading tags)

* eyeD3 - displays and manipulates id3-tags on mp3 files

# Coding style guide

We are following the coding styles of

* the [GNU Coding Standards](http://www.gnu.org/prep/standards/html_node/index.html)
* the [Bash Reference Manual](http://www.gnu.org/software/bash/manual/bashref.html)
* [Advanced Bash Scripting Guide](http://tldp.org/LDP/abs/html/index.html)
* Bash Style Guide and Coding Standards [german](http://www3.fh-swf.de/fbin/mehner/download/StyleGuideShell.pdf) / [english](http://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf)
* A [Guide](http://www.mpi-inf.mpg.de/~uwe/lehre/unixffb/quoting-guide.html) to Unix Shell Quoting

# Testframework

## List of testfiles needed

* cut correct - end 01.mp3
* cut correct - begin 01.mp3
* cut correct - begin and end 01.mp3
* error - no tag artist.mp3
* error - no tag title.mp3
* error - no mp3 file.mp3

## Tests

* outputfiles (cut correct\*.\*)
* correct (check binary, length, size, tags)
* error handling when bad input files (error\*.mp3) 

## ID3

[ID3](http://www.id3.org/Introduction) tags were designed with the MP3 file format in mind. ID3v2 tags will break formats which are container-based such as Ogg Vorbis and WMA.

## Vorbis

* [Vorbis I specification](http://www.xiph.org/vorbis/doc/Vorbis_I_spec.html#x1-810005)
* [VorbisComment](http://wiki.xiph.org/VorbisComment)

is a base-level Metadata format initially created for use with Ogg Vorbis. 
It has since been adopted in the specifications of Ogg encapsulations for 
other Xiph.Org codecs including Theora, Speex and FLAC. 

## A very cute reference sound

* [Origin link not reachable](http://www.xiph.org/vorbis/listen.html) (not reachable)
* [Sound 1](http://replay.waybackmachine.org/20090628120921/http://www.xiph.org/vorbis/listen.html)
* [Sounds 2](http://replay.waybackmachine.org/20081004221732/http://www.xiph.org/vorbis/listen/41_30secOgg-b64M.wav)

### This file is part of fadecut 

https://github.com/fadecut/fadecut
                                                                                
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
