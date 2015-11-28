"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from pathlib import Path

from flask import render_template, request
from . import mod_terminal

@mod_terminal.route('/', methods=['POST'])
def terminal():
    return ""