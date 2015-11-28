"""
    Charon-Fileserver
    ======

    Delivers and relieves files (or updates) from the server
"""

from flask import Blueprint

mod_fileserver = Blueprint('mod_fileserver', __name__)

from . import views