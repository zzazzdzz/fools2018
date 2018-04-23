import os

import server
import gui
            
try:
    gui.start()
    server.run()
except KeyboardInterrupt:
    os._exit(0)
