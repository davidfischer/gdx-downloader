#!/bin/bash

##############################################################################
# GDX Downloader - the MLB Gameday downloader
# Homepage: https://github.com/davidfischer/gdx-downloader
# Author: David Fischer <djfische@gmail.com>
# Version: 0.0.1
##############################################################################

# Wait time in seconds between HTTP requests
# This wait time should NEVER be set to zero unless you're making only a
# couple requests. Without this wait, the downloader could make 20+
# requests per second and result in the banstick from the Gameday guys.
WAIT=0.1

# Recursive depth to download
LEVEL=10

# This is the number of directories (not counting the host) to cut from output
# For example, for http://gdx.mlb.com/components/game/mlb/year_2012
# cutting 2 directories would remove "componenents" and "game" and place
# output under mlb/
CUT_DIRS=2

# Output log file. By default this log is appended to.
LOGFILE=output.log

USAGE="USAGE: ./gdxdownloader.sh <URL>

Download a specific game
 ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/gid_2012_04_01_nyamlb_miamlb_1/
Download all games for a specific day
 ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/
Download all games for a specific month
 ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/

Output goes to mlb/ in the current directory and starts at components/game/mlb.
If downloading a directory, the URL *MUST* end with a '/'
"

[[ -z "$1" ]] && echo "$USAGE" && exit 1

# Download all files under a particular URL
#
# Ignore robots.txt since the website blocks all robot access
wget --wait=$WAIT --random-wait --no-host-directories \
     --cut-dirs=$CUT_DIRS --recursive --level=$LEVEL --relative \
     --no-parent --no-verbose --append-output=$LOGFILE \
     --reject="[0-9]*_[0-9].xml,atv*.xml,scoreboard_*.xml,*.json,ac.xml,bc.xml,ec.xml,o[0-9].xml,pch.xml,pcu.xml,pf[a-z].xml,pkn.xml,psi.xml,psl.xml,r0.xml,r123.xml,risp.xml,ron.xml,vl.xml,vr.xml,zn.xml,pitchtendencies*.xml,notifications_*.xml,*.plist" \
     -e robots=off $1
