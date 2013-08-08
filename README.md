GDX Downloader
==============

This is a simple downloader for the data from the
[Gameday website](http://gdx.mlb.com/components/game/mlb/).


Usage
=====

    ./gdxdownloader.sh <URL>

    # Download a specific game
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/gid_2012_04_01_nyamlb_miamlb_1/
    # Download all games for a specific day
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/
    # Download all games for a specific month
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/

Output goes to mlb/ in the current directory and starts at components/game/mlb.
If downloading a directory, the URL *MUST* end with a '/'
