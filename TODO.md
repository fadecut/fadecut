# TODO's for release 0.2.0

## check license of songs and document if needed in copyrights

Here you have:
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

# Later

* cross correlation with well known ad files
* maybe we could use ffmpeg instead of sox/lame 
* wishlist: put a file in $fadecuthome with a list of artist/titles
	start fadecut with special option (-w for example) and fadecut
	will rip/process only files which are on the wishlist.
	this should work with many fadecut processes in parallel, to scan on
	many internet-radio stations in parallel to complete the wishlist as
	fast as possible
* mp3 normalization / replaygain   
* id3 tags umlaut are not correct on N900, wrong characterset

## to define who will code this
* statistics reporting
* catch such errors:
	streamripper http://club-high.rautemusik.fm/listen.pls
	Connecting...
	error -6 [SR_ERROR_CANT_RESOLVE_HOSTNAME]
	bye..
	shutting down
* find tag on which we write something like 'processed by fadecut vx.y.z' incl date, version, time, encoder and its version, streamripper and version
* define constant with version of fadecut
* lyrics in tags
* song/album title
* add support for aacPlus Streams and \*.aac files [example](http://www.radioswissjazz.ch/live/aacp.m3u)
* maybe we need to use vbrfix on mp3 files? 
* auto download album art (when more than one: let user select / take newest / take that one with best quality)
* auto download lyrics
* auto download guitar tabs

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
