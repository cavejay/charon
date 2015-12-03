"""
    Terminal Views
    =====

    Url routes are specified here.
"""
from pathlib import Path
import platform;
from flask import jsonify, send_from_directory
from flask import request

from charon.mod_fileserver.fileserver_util import get_file_data
from . import mod_fileserver

@mod_fileserver.route('/list/<path:folder>', methods=['POST', 'GET'])
@mod_fileserver.route('/list//<path:folder>', methods=['POST', 'GET'])
def list_folder(folder):
    """
    List a folder on the filesystem
    :return:
    """

    if platform.system() == 'Windows':
        p = Path(folder)
    else:
        p = Path('/' + folder)

    files = [get_file_data(item) for item in p.iterdir()]

    return jsonify(dict(data=files))


@mod_fileserver.route('/list/', methods=['POST', 'GET'])
def list_root_folder():
    """
    List the root directory on the filesytem
    :return:
    """

    p = Path('/')

    files = [get_file_data(item) for item in p.iterdir()]

    return jsonify(dict(data=files))


@mod_fileserver.route('/get/<path:file>', methods=['POST', 'GET'])
@mod_fileserver.route('/get//<path:file>', methods=['POST', 'GET'])
def deliver_file(file):
    """
    Sends a download request to
    :param file:
    :return:
    """

    if platform.system() == 'Windows':
        p = Path(file)
    else:
        p = Path('/' + file)

    return send_from_directory(directory=str(p.parent.resolve()), filename=p.name)


@mod_fileserver.route('/del/<path:file>', methods=['POST'])
@mod_fileserver.route('/del//<path:file>', methods=['POST'])
def delete_file(file):
    """
    Deletes a specific file from the host machine. Returns HTTP errors if there are problems
    :param file: Path to the file to delete
    :return: Either 200, or an applicable error.
    """
    if platform.system() == 'Windows':
        p = Path(file)
    else:
        p = Path('/' + file)

    if p.exists() != True:
        return str(404)

    try:
        p.unlink()

    except FileNotFoundError:
        return str(404)

    except PermissionError:
        return str(401)

    return str(200)


@mod_fileserver.route('/pack/<path:file>', methods=['POST'])
@mod_fileserver.route('/pack//<path:file>', methods=['POST'])
def append_file(file):
    """
    Takes file data and inserts it into either a new file or replaces an old file.
    :param file:
    :return:
    """

    data = request.form.getlist('text')[0]

    if platform.system() == 'Windows':
        p = Path(file)
    else:
        p = Path('/' + file)

    if p.is_dir():
        return str(400)

    try:
        f = open(str(p.absolute()), 'w')
        f.write(data)
        f.close()

    except PermissionError:
        return str(401)

    return str(200)
