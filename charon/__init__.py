"""
    Charon
    ======

    Project for a browser based desktop like utility
"""

from flask import Flask
from charon.mod_terminal import mod_terminal
from charon.serversessions import MongoSession, MongoSessionInterface

application = Flask(__name__)
application.register_blueprint(mod_terminal, url_prefix='/terminal')
application.config['terminal'] = {}
application.session_interface = MongoSessionInterface(db='sessiondb')

from . import views
