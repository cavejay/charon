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

    :return:
    """

    term_num = len(current_app.config['terminal'].keys())

    if hasSpur:
        s = spur.LocalShell()
        current_app.config['terminal'][term_num] = {}
        current_app.config['terminal'][term_num]['shell'] = s
        current_app.config['terminal'][term_num]['workingdir'] = str(Path().resolve())
    else:
        current_app.config['terminal'][term_num]['shell'] = None

    return str(term_num)


@mod_terminal.route('/<int:term_num>', methods=['POST'])
def terminal_input(term_num):
    """

    :param term_num:
    :return:
    """
    if term_num not in current_app.config['terminal']:
        return abort(400)

    # Sneaky sneaky worky worky for Windows
    if not hasSpur:
        return subprocess.check_output(request.form.getlist('command')[0], shell=True)
        # p = subprocess.Popen('cmd.exe /k', shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        # p.stdin.write(request.data)
        # return p.communicate()[0].decode()

    shell = current_app.config['terminal'][term_num]['shell']
    data = request.form.getlist('command')[0].split(' ')

    # Enable cd command in a completely ligit way
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
        result = shell.run(data, cwd=current_app.config['terminal'][term_num]['workingdir'], allow_error=True)

        if result.return_code != 0:
            message = result.stderr_output.decode()
        else:
            message = result.output.decode()

        return json.dumps({'output': message}), 200, {'ContentType':'application/json'} 


@mod_terminal.route('/<int:term_num>/close', methods=['POST'])
def terminal_close(term_num):
    """

    :param term_num:
    :return:
    """
    if term_num not in current_app.config['terminal']:
        return abort(400)

    current_app['terminal'].pop(term_num)

    return str(term_num)


#     fds = current_app.config['terminal'][name];
#     pty.
#     del current_app.config['terminal'][name]
#     p.kill()
#     return "DONE"
