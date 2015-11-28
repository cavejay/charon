"""
    Terminal Views
    =====

    Url routes are specified here.
"""
import os
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


@mod_fileserver.route('/del/<path:file>', methods=['POST'])
def delete_file(file):
    p = Path('/' + file)

    if p.exists() != True:
        return "File does not exist"

    try:
        p.unlink()

    except FileNotFoundError:
        return "Cannot remove file"

    except PermissionError:
        return "No permissions to delete file"

    return "Removed"


@mod_fileserver.route('/create/<path:file>/', methods=['POST'])
def append_file(file):
    """
    Takes file data and inserts it into
    :param file:
    :return:
    """
    data = request.data
    p = Path('/' + file)

    return str(p) + ' Super data incomeing ' + str(data)

