"""
    Views
    =====

    Url routes are specified here.
"""

from pathlib import Path

from flask import render_template, jsonify
from . import application


@application.route('/')
def index():
    """
    Root path of the website.
    :return: HTML content of the rooth path.
    """

    return render_template('index.html')


@application.route('/hello/<name>')
def say_hello(name):
    return 'Hello {}!'.format(name)


@application.route('/list/<path:folder>')
def list_folder(folder):
    """
    List a folder on the filesystem
    :return:
    """
    p = Path('/' + folder)

    files = [item.name for item in p.iterdir()]

    return jsonify(dict(data=files))
