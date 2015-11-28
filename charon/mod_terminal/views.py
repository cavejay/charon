"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
import subprocess
from flask import render_template, request, session, jsonify, current_app
from . import mod_terminal

@mod_terminal.route('/open', methods=['POST'])
def terminal_open():
    p = subprocess.Popen("cmd", shell=True, stdin=subprocess.PIPE)

    name = 'term1'
    i = 1
    while name in current_app.config['terminal']:
        i += 1
        name = 'term{0}'.format(i)

    current_app.config['terminal'][name] = p;
    return name

@mod_terminal.route('/<name>', methods=['POST'])
def terminal_input(name):
    return ""

@mod_terminal.route('/<name>/close', methods=['POST'])
def terminal_close(name):
    app = current_app._get_current_object()
    return app.config['something']