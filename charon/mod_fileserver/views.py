"""
    Terminal Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
from flask import jsonify, send_from_directory
from flask import render_template, request
from . import mod_fileserver

@mod_fileserver.route('/', methods=['POST'])
def terminal():
    return "lalala"

@mod_fileserver.route('/list/<path:folder>')
def list_folder(folder):
    """
    List a folder on the filesystem
    :return:
    """
    p = Path('/' + folder)

    files = [item.name for item in p.iterdir()]

    return jsonify(dict(data=files))


@mod_fileserver.route('/get/<path:file>', methods=['POST', 'GET'])
def deliver_file(file):
    """
    Sends a download request to
    :param file:
    :return:
    """


    p = Path('/' + file)

    return send_from_directory(directory=str(p.parent.resolve()), filename=p.name)