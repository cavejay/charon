from functools import wraps
from flask import request, Response, session, abort, redirect, url_for

def check_auth(username, password):
    """
    Check the authorisation of a username and password

    :param username: the username to check
    :param password: the password to check
    :return: true if auth successful, false otherwise
    """
    return username == "koth" and password == "kothPassword"

def requires_auth(f):
    """

    :param f:
    :return:
    """
    @wraps(f)
    def decorated(*args, **kwargs):
        if not 'username' in session or not 'password' in session or not check_auth(session['username'], session['password']):
            return redirect(url_for('login'))
            #return Response('Login!', 401, {'WWW-Authenticate': 'Basic realm="Login!"'})
        return f(*args, **kwargs)
    return decorated

def authorise(username, password):
    """

    :param username:
    :param password:
    :return:
    """
    if check_auth(username, password):
        session['username'] = username
        session['password'] = password
        return True
    return False