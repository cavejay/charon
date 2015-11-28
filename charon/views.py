"""
    Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
from flask import jsonify, request, session, flash, redirect, render_template, url_for, Response
from . import application

from charon.authentication import requires_auth

@application.route('/')
@requires_auth
def index():
    """
    Root path of the website.
    :return: HTML content of the root path.
    """
    # return render_template('index.html', name=None)
    # return application.send_static_file(render_template('index.html'))
    return application.send_static_file('index.html')


@application.route('/login')
def login():
    return "IDK"


