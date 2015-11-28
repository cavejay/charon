"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from flask import current_app, request, abort
import subprocess
import json
from . import mod_terminal
from pathlib import Path

# Import spur if possible (will fail on Windows)
try:
    import spur
    hasSpur = True
except ImportError:
    hasSpur = False


@mod_terminal.route('/open', methods=['POST'])
def terminal_open():
    """
    Opens a new terminal session

    :return: the id of the terminal session
    """

    term_num = len(current_app.config['terminal'].keys())

    current_app.config['terminal'][term_num] = {}

    if hasSpur:
        s = spur.LocalShell()

        current_app.config['terminal'][term_num]['shell'] = s
    else:
        current_app.config['terminal'][term_num]['shell'] = None

    current_app.config['terminal'][term_num]['workingdir'] = str(Path().resolve())

    return str(term_num)


@mod_terminal.route('/<int:term_num>', methods=['POST'])
def terminal_input(term_num):
    """
    Send a command to the given terminal session

    :param term_num: the terminal session
    :return: the stdout output
    """
    if term_num not in current_app.config['terminal']:
        return abort(400)

    shell = current_app.config['terminal'][term_num]['shell']
    data = request.form.getlist('command')[0].split(' ')

    # Enable cd command in a completely legit way
    if data[0] == 'cd':
        if len(data) == 1:
            current_app.config['terminal'][term_num]['workingdir'] = str(Path().resolve())
            message = ''
        else:
            new_path = str(Path(current_app.config['terminal'][term_num]['workingdir'] + "/" + data[1]).resolve())
            current_app.config['terminal'][term_num]['workingdir'] = new_path
            message = ''
        return json.dumps({'output': message}), 200, {'ContentType':'application/json'}
    else:
        # Sneaky sneaky worky worky for Windows
        if not hasSpur:
            try:
                message = subprocess.check_output(request.form.getlist('command')[0], shell=True,
                                                 cwd=current_app.config['terminal'][term_num]['workingdir'])
            except subprocess.CalledProcessError:
                message = "Invalid Command"
            return json.dumps({'output': message.decode()}), 200, {'ContentType':'application/json'}

        result = shell.run(data, cwd=current_app.config['terminal'][term_num]['workingdir'], allow_error=True)

        if result.return_code != 0:
            message = result.stderr_output.decode()
        else:
            message = result.output.decode()

        return json.dumps({'output': message}), 200, {'ContentType':'application/json'} 


@mod_terminal.route('/<int:term_num>/close', methods=['POST'])
def terminal_close(term_num):
    """
    Close a terminal session

    :param term_num: the terminal session
    :return: the terminal session id that was closed
    """
    if term_num not in current_app.config['terminal']:
        return abort(400)

    current_app['terminal'].pop(term_num)

    return str(term_num)
