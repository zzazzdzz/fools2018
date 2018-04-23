# fools2018

TheZZAZZGlitch's April Fools Event 2018. A save file for Pokémon Yellow that contained an open world to explore, called Glitchland. All of the game's content was dynamically downloaded from the internet via some link cable magic. The players would receive points and achievements for completing certain quests, and the progress was shown online on the event site.

That's exactly what happened between 1st and 24th of April, 2018, before I had to shut down the game servers. Following this, a decision was made to release the complete source code for the event and all of its components, so everyone can now run their own Glitchland at home.

![](https://cdn.pbrd.co/images/HhQYi99.png)

Attention: Everything here is kept for historical record, and such, any bugs and issues will not be resolved. Fork the repository if you wish to build something on top of it.

# The contents

 - *savefile/* - The event SAV file, as well as source files for all of the maps.
 - *networking/server* - The game server.
 - *networking/client* - The desktop game client.
 - *site/* - The original event site, just like it was on the 1st of April. Also includes the HTML5 game client.
 - *extras/* - All sorts of stuff that was used in the game creation process. Note that all of the code here in *extras* was written quickly for one-time use, so it's definitely not production-quality; you have been warned.

# Getting stuff to work

To compile the event save file and the maps, run the `build.py` script (`python3 build.py`). The script requires the [rgbbin Python library](https://github.com/zzazzdzz/rgbbin) to be installed. After the build process is done, two files should be produced: *build/glitchland.sav*, which is just the save file, and *build/sram.js*, which is the same save data, represented as a JavaScript byte array - this should be put in the *js/* directory of the HTML5 client files. The *../bin* directory will also be populated with map files - these are used by the game server.

The server is a standard WSGI application. If you just wish to start a development environment for testing, run `python3 main.py` in the server directory. Requests will be then served on 127.0.0.1:12709.
Of course, the development environment is intended only for testing, or for playing the game alone. If you wish to actually run the server in public, take care to deploy a better setup. I for example, have used [gunicorn](http://gunicorn.org/) + nginx, and PostgreSQL as a database backend (the development environment uses SQLite).

The desktop client is once again, just Python 3. Run `python3 main.py` to start it. You can also use [py2exe](http://www.py2exe.org/) to convert the script into a standalone EXE file, just like it was during the event.

The event site is static and only uses JavaScript to make requests - so any HTTP server is capable of serving this website. If you don't have any HTTP servers set up anywhere, you can once again whip out Python to create a development environment. Go to the website directory and run `python3 -m http.server`. The site will be live on 127.0.0.1:8000.

Compile the save file and the maps, run the game server, run the event site, and you've got everything working, just like it was on the 1st of April.

# Everything else you might want to know about

### bepis

During the event's period, several unused maps were discovered by the player community. They were all named *bepis* - this is a default string the server returns if the map in question has no name assigned. The existence of these maps was a side effect of the build process - whenever a map's source file was deleted or moved, its compiled data would still linger in the *bin* directory. Those maps would still be served if the server was requested to do so.

I realized this small curiosity during development, but I decided to leave it in. After all, Glitchland was about discovering all of the secrets. Finding unused content was very in flavor, added to the mystery and kept people interested about the game.

Because *bepis maps*, as the community dubbed them, are just leftover binary files and do not have any corresponding source files, they are not included in this source code release.

### Database stuff

The server release comes with a ready to use SQLite database. It has one registered user: *admin*, with a password *admin*. Everything else is empty or populated with default values.

The extras directory contains a database structure dump at *db.sql*. You can use it to reconstruct the database under a different DB engine. Remember to take care to rewrite the *sql(query, params)* function in `storage.py`, so the server can support the new database backend.

### The tools

The *extras* directory contains some of the tools used during game development, that you may want (or may not want) to use yourself.

- *map_edit.htm* - a simple JavaScript+HTML map editor. Set the map's width and height, draw out the map and copy the generated code to the map's source file.
- *map_conn.htm* - a simple JavaScript+HTML editor for map borders. Load up a map and draw around the borders - the corresponding RAM script code will be generated.
- *stubber.py* - automatically generates stubs for all unused textbox IDs in a map's source file.
- *img2tiles.vb* - a quick VB .NET console program that generates the font definitions used by the game's text engine from Nx8 image strips. An example *tiles.png* file is included.

Most of them are buggy and were only intended as quick one-time-use scripts. Proceed with caution.

