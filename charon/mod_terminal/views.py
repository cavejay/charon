"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
import subprocess
from flask import render_template, request, session, jsonify, current_app, abort
from . import mod_terminal

@mod_terminal.route('/', methods=['POST'])
def terminal():
    p = subprocess.Popen(['/bin/bash'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

    (out, err) = p.communicate(input=request.data)
    return out

# @mod_terminal.route('/open', methods=['POST'])
# def terminal_open():
#     # Open new terminal subprocess
#     # NEED MULTIOS SUPPORT!
#     #p = subprocess.Popen(['C:/Program Files (x86)/Git/bin/sh'], shell=True,
#     #                     stdin=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=1)
#     #(stdout, stderr) = p.communicate(input="echo something".encode())
#     #p.stdin.write("echo something".encode())
#     #p.stdin.write("how even".encode())
#     #p.stdout.flush()
#     #s = p.stdout.read().decode()
#     #return s
#     # Give the terminal session a name
#     fds = pty.openpty()
#     name = 'term1'
#     i = 1
#     while name in current_app.config['terminal']:
#         i += 1
#         name = 'term{0}'.format(i)
#
#     current_app.config['terminal'][name] = fds;
#     return name
#
# @mod_terminal.route('/<name>', methods=['POST'])
# def terminal_input(name):
#     if name not in current_app.config['terminal']:
#         return abort(400)
#     p = current_app.config['terminal'][name]
#     p.stdin.write("echo something".encode())
#     return p.stdout.read()

# @mod_terminal.route('/<name>/close', methods=['POST'])
# def terminal_close(name):
#     if name not in current_app.config['terminal']:
#         return abort(400)
#     fds = current_app.config['terminal'][name];
#     pty.
#     del current_app.config['terminal'][name]
#     p.kill()
#     return "DONE"
