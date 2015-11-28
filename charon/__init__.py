"""
    Charon
    ======

    Project for a browser based desktop like utility
"""

from flask import Flask
from charon.mod_terminal import mod_terminal

application = Flask(__name__)
application.register_blueprint(mod_terminal, url_prefix='/terminal')

from . import views
