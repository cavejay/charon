"""
    Charon
    ======

    Project for a browser based desktop like utility
"""

from flask import Flask
from charon.mod_terminal import mod_terminal
from charon.mod_fileserver import mod_fileserver

application = Flask(__name__)
application.register_blueprint(mod_terminal, url_prefix='/terminal')
application.register_blueprint(mod_fileserver, url_prefix='/fs')

from . import views
