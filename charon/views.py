"""
    Views
    =====

    Url routes are specified here.
"""

from pathlib import Path

from flask import jsonify, request, session, flash, redirect, render_template, url_for, Response
from . import application


@application.route('/')
def index():
    """
    Root path of the website.
    :return: HTML content of the root path.
    """
    # return render_template('index.html', name=None)
    # return application.send_static_file(render_template('index.html'))
    return application.send_static_file('index.html')


@application.route('/list/<path:folder>')
def list_folder(folder):
    """
    List a folder on the filesystem
    :param folder: Path provided in the url to list contents of.
    :return:
    """
    p = Path('/' + folder)

    files = [item.name for item in p.iterdir()]

    return jsonify(dict(data=files))


@application.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != "dsa":
            error = 'Invalid username'
        elif request.form['password'] != "asd":
            error = 'Invalid password'
        else:
            session['logged_in'] = True
            flash('You were logged in')
            return redirect(url_for('show_entries'))
    return Response("IDK", content_type='text/event-stream')