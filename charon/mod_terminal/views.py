"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from flask import current_app, request, abort
import spur
from . import mod_terminal


@mod_terminal.route('/open', methods=['POST'])
def terminal_open():
    """

    :return:
    """

    term_num = len(current_app.config['terminal'].keys())

    s = spur.LocalShell()
    current_app.config['terminal'][term_num] = s

    return str(term_num)


@mod_terminal.route('/<int:term_num>', methods=['POST'])
def terminal_input(term_num):
    """

    :param term_num:
    :return:
    """
    if term_num not in current_app.config['terminal']:
        return abort(400)

    shell = current_app.config['terminal'][term_num]
    result = shell.run(request.data.split())
    return result.output


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
