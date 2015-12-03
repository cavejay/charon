"""
    Views
    =====

    Url routes are specified here.
"""

from pathlib import Path
import platform
from flask import jsonify, request, session, flash, redirect, render_template, url_for, Response, abort
from . import application

from charon.authentication import requires_auth, authorise

@application.route('/')
#@requires_auth
def index():
    """
    Root path of the website.
    :return: HTML content of the root path.
    """
    # return render_template('index.html', name=None)
    # return application.send_static_file(render_template('index.html'))
    return application.send_static_file('index.html')

@application.route('/demo')
def demo():
    """
    Path to the application demo slides.
    :return: HTML content for the demo.
    """
    return application.send_static_file('demo.html')


@application.route('/login', methods=['POST'])
def login():
    if len(request.form.getlist('username')) == 0 or len(request.form.getlist('password')) == 0:
        return abort(400)
    username = request.form.getlist('username')[0]
    password = request.form.getlist('password')[0]

    if authorise(username, password):
        return Response(status=200)
    return abort(401)

@application.route('/platform', methods=['GET'])
def getPlatform():
    """
    Retrieve the platform data for the backend

    :return: JSON data about the backend system
    """
    result = {'os': platform.system(),
              'python-version': platform.python_version()}

    return jsonify(result)
