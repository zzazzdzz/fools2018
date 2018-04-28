import os

import server
import gui

try:
    server.start()
    gui.start()
except KeyboardInterrupt:
    os._exit(0)
