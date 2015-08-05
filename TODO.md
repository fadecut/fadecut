This file is part of fadecut                                                    
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


# --- bugs on master branch ----------------------------------------------------
* current no
# --- 0.2.0 release ------------------------------------------------------------
* marco Change ${vars} to $vars
* marco Testframework:
	  Take testing upstream code directly from git,
	  add more tests.
	  Testframework executed by dpkg-buildpackage.
* marco stats, processed songs per hour
* marco logging(): no warning output's, if no -v (verbose) is selected
* marco check license of songs and document if needed in copyrights
	here you have:
	apt-get install yofrankie
	/usr/share/yofrankie-bge/audio
	we took:
	FrankieDeath.wav
	frankie_dielava.wav
	frankieloop2.wav
        head /usr/share/doc/yofrankie/copyright:
	Name: Yo Frankie!
	Maintainer: Campbell Barton <ideasman42@gmail.com>
	Source: http://www.yofrankie.org/
	Copyright: 2008, Blender Foundation, www.blender.org
	License: GPL-2+

* tinu  complete fileprocessing test in testframework
* tinu  how to handle case of tags? camel, higher or lowercase?
        decide and code it
* tinu  how to handle filenames like this: 
        Gloria Estefan - 1 - 2 - 3.mp3 / gloria_estefan_-_1_-_2_-_3.mp3
        PLATINUM - SIGNALS(GAUDINO & ROONEY EDIT).mp3 / platinum_-_signals(gaudino_&_rooney_edit).mp3 (for example put an underscore before paranthesis)

# --- later --------------------------------------------------------------------
* tinu  change to getopt(1) to be able to parse --long-options
* tinu  add bpm tags (use of debian packet bpm-tools)
* tinu  cross correlation with well known ad files
* tinu  maybe we could use ffmpeg instead of sox/lame 
* tinu  wishlist: put a file in $fadecuthome with a list of artist/titles
          start fadecut with special option (-w for example) and fadecut
          will rip/process only files which are on the wishlist.
          this should work with many fadecut processes in parallel, to scan on
          many internet-radio stations in parallel to complete the wishlist as
          fast as possible
* tinu  mp3 normalization / replaygain   
* tinu  id3 tags umlaut are not correct on N900, wrong characterset

to define who will code this:
* team  statistics reporting
* team  catch such errors:
	streamripper http://club-high.rautemusik.fm/listen.pls
	Connecting...
	error -6 [SR_ERROR_CANT_RESOLVE_HOSTNAME]
	bye..
	shutting down
* team  find tag on which we write something like 'prcoessed by fadecut vx.y.z'
        incl date, version, time, encoder and its version, streamripper and version
* team  define constant with version of fadecut
* team  lyrics in tags
* team  song/album title
* team  add support for aacPlus Streams and *.aac files
        example: http://www.radioswissjazz.ch/live/aacp.m3u
* team  maybe we need to use vbrfix on mp3 files? 
* team  auto download album art (when more than one: let user select / take newest / take that one with best quality)
* team  auto download lyrics
* team  auto download guitar tabs
