# fadecut 0.2.1

- added documentation about fadecutrc, profiles and statslog into the man page, closing issue #54 and thanks to @dances-with-clouds for the bugreport 
- preserve timestamps of downloaded files, closing issue #55 with thanks to @dances-with-clouds

# fadecut 0.2.0

- Migrate documentation in markdown `.md` files.
- Generate manpage file from markdown file.
- Logo for fadecut added
- Statistics are not anymore shown at the end if invalid option is given. Closing issue #24
- expand given path for input and output directory to get no bad states. related to issue #28.
- Fixed issues #29 and #30
- Pull request #49: Add (-t) timestamp switch on each written file. Thanks to @fapo85
- Add support for .opus encoding
- Fix wrong usage of $BIN_SOX
- Fix wrong script usage of $BIN_ID3V2
- Cleanup & fix test environment
- Add autotesting for .opus encoding
- better handling of getting options to ensure adequate output according 
  to -v (verbose) and -q (quiet) commandline options
- Fixed issue "error after upgrade to Debian testing" #32. Thanks to @LaPriWa.
- Fixed issue "does not check for installed lame encoder" #33
- Have a look [here](https://github.com/fadecut/fadecut/milestone/1?closed=1)

# fadecut 0.1.4

-   Merged pull request from https://github.com/TobleMiner Added custom
    editor selection. Script now considers \$EDITOR environment variable
    first, before choosing vi/vim

# fadecut 0.1.3

-   Fixed github.com issue \#2 "add custom USER\_AGENT" Thanks to
    https://github.com/mitsukarenai

# fadecut 0.1.2

-   Fixed github.com issue \#1 "pidof streamripper problem"

# fadecut 0.1.1

-   Exeption handling (Closes debian bug: \#645392)

# fadecut 0.1.0

-   ripping option -s changed to -r
-   write log to \~/.fadecut/statslog.csv for statistics
-   autoconverting tags from id3v1 to id3v2
-   double files are now 0 byte size
-   removed mp3info, now using sox to get information about audio file
-   removed mp3splt, now using sox to split audio files
-   improve shutdown behaviour. All exit codes and logging messages
    justified.
-   added silence cutting. no more long silence at beginning and end of
    files.
-   Testframework, first tests added

# fadecut 0.0.2

-   removed repetition of unnessesary logging
-   libsox-fmt-mp3 is needed on debian/ubuntu
-   removed -m method

# fadecut 0.0.1

-   initial release
