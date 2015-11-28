"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
import subprocess
import tempfile
from flask import render_template, request, session, jsonify, current_app, abort
from . import mod_terminal

@mod_terminal.route('/open', methods=['POST'])
def terminal_open():
    # Open new terminal subprocess
    # NEED MULTIOS SUPPORT!
    p = subprocess.Popen(['/bin/bash'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=1)
    #(stdout, stderr) = p.communicate(input="echo something".encode())
    p.stdin.write("echo something".encode())
    s = p.stdout.readline().decode()
    return s
    #p.stdin.write("how even".encode())
    #s = p.stdout.read()
    # Give the terminal session a name
    name = 'term1'
    i = 1
    while name in current_app.config['terminal']:
        i += 1
        name = 'term{0}'.format(i)

    current_app.config['terminal'][name] = p;
    return name

@mod_terminal.route('/<name>', methods=['POST'])
def terminal_input(name):
    if name not in current_app.config['terminal']:
        return abort(400)
    p = current_app.config['terminal'][name]
    p.stdin.write("echo something".encode())
    return p.stdout.read()

@mod_terminal.route('/<name>/close', methods=['POST'])
def terminal_close(name):
    if name not in current_app.config['terminal']:
        return abort(400)
    p = current_app.config['terminal'][name]
    del current_app.config['terminal'][name]
    p.kill()
    return "DONE"
