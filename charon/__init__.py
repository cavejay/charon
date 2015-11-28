"""
    Charon
    ======

    Project for a browser based desktop like utility
"""

from flask import Flask
from .mod_terminal import mod_terminal
from .mod_fileserver import mod_fileserver
from .serversessions import MongoSession, MongoSessionInterface

application = Flask(__name__)

application.register_blueprint(mod_terminal, url_prefix='/terminal')
application.config['terminal'] = {}
application.session_interface = MongoSessionInterface(db='sessiondb')

application.register_blueprint(mod_fileserver, url_prefix='/fs')

from . import views
