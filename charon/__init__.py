"""
    Charon
    ======

    Project for a browser based desktop like utility
"""

from flask import Flask

application = Flask(__name__)

from . import views
