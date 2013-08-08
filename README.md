GDX Downloader
==============

This is a simple downloader for the data from the
[Gameday website](http://gdx.mlb.com/components/game/mlb/).


Usage
-----

    ./gdxdownloader.sh <URL>

    # Download a specific game
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/gid_2012_04_01_nyamlb_miamlb_1/
    # Download all games for a specific day
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/day_01/
    # Download all games for a specific month
    ./gdxdownloader.sh http://gdx.mlb.com/components/game/mlb/year_2012/month_04/

Output goes to mlb/ in the current directory and starts at components/game/mlb.
If downloading a directory, the URL *MUST* end with a '/'. The downloader
goes [breadth-first](https://en.wikipedia.org/wiki/Breadth-first_search).


Directory structure
-------------------

    mlb/  # Major League Baseball
    |-- year_(\d{4})/  # A specific year of games and player statistics
        |-- batters/
        |   |-- (\d{6}).xml  # Season stats for batters with the given MLB id
        |-- month_(\d{2})/  # A specific month of games
        |   |-- day_(\d{2})/  # A specific day of games
        |   |   |-- batters/
        |   |   |   |-- (\d{6})_(\d).xml   # Batter's daily stats # _2 = doubleheader
        |   |   |-- gid_(\d{4})_(\d{2})_(\d{2})_\w{3}mlb_\w{3}mlb_(\d)    # YYYY_MM_DD, team abbrevs, doubleheader
        |   |   |   |-- batters/
        |   |   |   |-- bench.xml
        |   |   |   |-- boxscore.xml
        |   |   |   |-- game.xml
        |   |   |   |-- inning/  # Contains pitch stats by inning (inc. pitch/fx)
        |   |   |   |-- linescore.xml
        |   |   |   |-- pitchers/
        |   |   |   |-- players.xml
        |   |   |   |-- plays.xml
        |   |   |-- pitchers/
        |   |   |   |-- (\d{6})_(\d).xml   # Pitcher's daily stats # _2 = doubleheader
        |--- pitchers/
            |-- (\d{6}).xml  # Season stats for pitchers with the given MLB id
    aaa/  # Triple-A ball
    aax/  # Double-A ball
